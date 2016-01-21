# Whole library

class Rb < React::NativeLibrary
  imports 'rb'
end

def style_types
  %w( primary success info warning danger)
end

def button_types
  style_types + [:default, :link]
end

module Webpack
  class ButtonExamples < React::Component::Base
    def render
      div {
        h2 { "Button examples" }
        button_types.each { |style|
          Rb.Button(bsStyle: style) { style.capitalize }.on(:click) {alert style}
        }
      }
    end
  end

  class ModalExample < React::Component::Base
    define_state show_modal: false

    def close
      state.show_modal! false
    end

    def render
      div {
        h2 { 'Modal example' }
        Rb.Button(bsStyle: :primary) { 'show modal' }.on(:click) { state.show_modal! true  }
        Rb.Modal(show: state.show_modal, onHide: lambda { close }) {
          Rb.Modal.Title { 'Title' }
          Rb.Modal.Body {
            h4 { 'the body' }
          }
          Rb.Modal.Footer {
            Rb.Button { 'close' }.on(:click) { close }
          }
        }
      }
    end
  end

  class GridExample < React::Component::Base
    def render
      div {
        h2 { 'Grid example'}
        Rb.Grid {
          Rb.Row.show_grid {
            Rb.Col(xs: 12, md: 8) { '<Col xs={12} md={8} />'}
            Rb.Col(xs: 6, md: 4) { '<Col xs={6} md={4} />'}
          }
          Rb.Row.show_grid {
            Rb.Col(xs: 6, md: 4) { '<Col xs={6} md={4} />' }
            Rb.Col(xs: 6, md: 4) { '<Col xs={6} md={4} />' }
            Rb.Col(xs: 6, md: 4) { '<Col xs={6} md={4} />' }
          }
        }
      }
    end

  end
  class LabelExample < React::Component::Base
    def render
      div {
        h2 { 'Labels'}
        style_types.each { |style_type|
          Rb.Label(bsStyle: style_type) { style_type.capitalize}
        }
      }
    end
  end
  class AlertExample < React::Component::Base
    def render
      div {
        h2 { 'Alerts'}
        style_types.each { |style_type|
          Rb.Alert(bsStyle: style_type) { style_type.capitalize}
        }
      }
    end
  end

  class AutodismissAlertExample < React::Component::Base
    define_state :alert_visible

    # override global method because warning and danger cannot be auto dismissed
    def style_types
      %w( primary success info )
    end

    before_mount do
      hash = {}
      style_types.each { |style_type| hash[style_type] = true}
      state.alert_visible! hash
    end

    def dismiss_alert style_type
      puts "Dismissing #{style_type}"
      state.alert_visible! state.alert_visible.merge(style_type => false)
    end

    def render
      div {
        h2 { 'Auto dismiss Alerts'}
        delay = 1000
        style_types.each { |style_type|
          Rb.Alert(bsStyle: style_type, onDismiss: lambda { dismiss_alert(style_type)},  dismissAfter: delay) { style_type.capitalize} if state.alert_visible[style_type]
          delay += 1000
        }

      }
    end
  end

  class BadgeExample < React::Component::Base
    def render
      div {
        h2 { 'Badges' }
        p {
          span { 'Num emails ' }
          Rb.Badge { '110' }
        }
      }

    end
  end

  class AccordionExample < React::Component::Base
    def render
      div {
        h2 { 'Accordion' }
        Rb.Accordion {
          Rb.Panel(header: "accordion 1", eventKey: '1') {
            p {"Your bones don't break, mine do. That's clear. Your cells react to bacteria and viruses differently than mine. You don't get sick, I do. That's also clear. But for some reason, you and I react the exact same way to water. We swallow it too fast, we choke. We get some in our lungs, we drown. However unreal it may seem, we are connected, you and I. We're on the same curve, just on opposite ends."}
          }
          Rb.Panel(header: "accordion 2", eventKey: '2') {
            p { "Your bones don't break, mine do. That's clear. Your cells react to bacteria and viruses differently than mine. You don't get sick, I do. That's also clear. But for some reason, you and I react the exact same way to water. We swallow it too fast, we choke. We get some in our lungs, we drown. However unreal it may seem, we are connected, you and I. We're on the same curve, just on opposite ends."}
          }
          Rb.Panel(header: "accordion 3", eventKey: '3') {
            p {"Your bones don't break, mine do. That's clear. Your cells react to bacteria and viruses differently than mine. You don't get sick, I do. That's also clear. But for some reason, you and I react the exact same way to water. We swallow it too fast, we choke. We get some in our lungs, we drown. However unreal it may seem, we are connected, you and I. We're on the same curve, just on opposite ends."}
          }
        }
      }
    end
  end

  class TooltipExample < React::Component::Base
    def render
      tip = Rb.Tooltip(id: 'foo'){'a tooltip'}.as_node
      div {
        h2 { 'Tooltip Example'}
        Rb.ButtonToolbar {
          Rb.OverlayTrigger(placement: :top, overlay: tip.to_n) {
            Rb.Button { 'has tooltip' }
          }
          Rb.Button { 'no tooltip' }
        }
      }
    end
  end

  
  class ReactBootstrap < React::Component::Base

    def render
      div {
        h1 { 'react-bootstrap examples imported from webpack' }
        ButtonExamples {}
        GridExample {}
        ModalExample {}
        LabelExample {}
        AlertExample {}
        AutodismissAlertExample {}
        BadgeExample {}
        AccordionExample {}
        TooltipExample {}
      }

    end
  end
end
