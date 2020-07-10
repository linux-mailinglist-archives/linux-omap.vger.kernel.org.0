Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8817721C045
	for <lists+linux-omap@lfdr.de>; Sat, 11 Jul 2020 01:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbgGJXCY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Jul 2020 19:02:24 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37776 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726465AbgGJXCY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 10 Jul 2020 19:02:24 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A46822C0;
        Sat, 11 Jul 2020 01:02:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594422141;
        bh=LTdEtqT+NlaqDcv/+04cRbFvA5sYy0O/CsuUnk778K8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Cp6w3peNw+xdVcu0e5u6sCV+HY1jH+eJlCq3btwwdhQDl55V2IGPtokX+32bJ5sp2
         fk35lJ2Xvm5siGJBWWvGhc/L5I57sKFrsTK1N1SIc2C1iJLWbz1Q03i5vEX8ycz7Se
         YXa5ednNMvp8Bvsa3LGaI6pVoUajPtCc0uAMBjto=
Date:   Sat, 11 Jul 2020 02:02:15 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Sebastian Reichel <sre@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Tony Lindgren <tony@atomide.com>, Pavel Machek <pavel@ucw.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCHv1 1/4] dt-bindings: display: panel-dsi-cm: convert to YAML
Message-ID: <20200710230215.GC5964@pendragon.ideasonboard.com>
References: <20200629223315.118256-1-sebastian.reichel@collabora.com>
 <20200629223315.118256-2-sebastian.reichel@collabora.com>
 <20200630055031.GA361800@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200630055031.GA361800@ravnborg.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Sebastian,

Thank you for the patch.

On Tue, Jun 30, 2020 at 07:50:31AM +0200, Sam Ravnborg wrote:
> On Tue, Jun 30, 2020 at 12:33:12AM +0200, Sebastian Reichel wrote:
> > Convert panel-dsi-cm bindings to YAML and add
> > missing properties while at it.
> > 
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Thanks, one of the few panel bindings still pending.
> And you added some nice explanations too, good.
> 
> Some small comments in the folllowing.
> 
> > ---
> >  .../bindings/display/panel/panel-dsi-cm.txt   |  29 -----
> >  .../bindings/display/panel/panel-dsi-cm.yaml  | 100 ++++++++++++++++++
> >  2 files changed, 100 insertions(+), 29 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-dsi-cm.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt b/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt
> > deleted file mode 100644
> > index dce48eb9db57..000000000000
> > --- a/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt
> > +++ /dev/null
> > @@ -1,29 +0,0 @@
> > -Generic MIPI DSI Command Mode Panel
> > -===================================
> > -
> > -Required properties:
> > -- compatible: "panel-dsi-cm"
> > -
> > -Optional properties:
> > -- label: a symbolic name for the panel
> > -- reset-gpios: panel reset gpio
> > -- te-gpios: panel TE gpio
> > -
> > -Required nodes:
> > -- Video port for DSI input
> > -
> > -Example
> > --------
> > -
> > -lcd0: display {
> > -	compatible = "tpo,taal", "panel-dsi-cm";
> > -	label = "lcd0";
> > -
> > -	reset-gpios = <&gpio4 6 GPIO_ACTIVE_HIGH>;
> > -
> > -	port {
> > -		lcd0_in: endpoint {
> > -			remote-endpoint = <&dsi1_out_ep>;
> > -		};
> > -	};
> > -};
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.yaml b/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.yaml
> > new file mode 100644
> > index 000000000000..8d6a20f26470
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.yaml
> > @@ -0,0 +1,100 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/panel-dsi-cm.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: DSI command mode panels
> > +
> > +maintainers:
> > +  - Tomi Valkeinen <tomi.valkeinen@ti.com>
> > +  - Sebastian Reichel <sre@kernel.org>
> > +
> > +description: |
> > +  This binding file is a collection of the DSI panels that
> > +  are usually driven in command mode. If no backlight is
> > +  referenced via the optional backlight property, the DSI
> > +  panel is assumed to have native backlight support.
> 
> > +  The panel may use an OF graph binding for the association
> > +  to the display, or it may be a direct child node of the
> > +  display.
> 
> Later port: is required which does not really match this explanation.
> 
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +
> > +  compatible:
> > +    items:
> > +      - enum:
> > +        - motorola,droid4-panel        # Panel from Motorola Droid4 phone
> > +        - nokia,himalaya               # Panel from Nokia N950 phone
> > +        - tpo,taal                     # Panel from OMAP4 SDP board
> > +      - const: panel-dsi-cm            # Generic DSI command mode panel compatible fallback
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: DSI virtual channel
> > +
> > +  vddi-supply:
> > +    description:
> > +      Display panels require power to be supplied. While several panels need
> > +      more than one power supply with panel-specific constraints governing the
> > +      order and timings of the power supplies, in many cases a single power
> > +      supply is sufficient, either because the panel has a single power rail, or
> > +      because all its power rails can be driven by the same supply. In that case
> > +      the vddi-supply property specifies the supply powering the panel as a
> > +      phandle to a regulator.
> > +
> > +  vpnl-supply:
> > +    description:
> > +      When the display panel needs a second power supply, this property can be
> > +      used in addition to vddi-supply. Both supplies will be enabled at the
> > +      same time before the panel is being accessed.
> > +
> > +  width-mm: true
> > +  height-mm: true
> > +  label: true
> > +  rotation: true
> > +  panel-timing: true
> > +  port: true
> > +  reset-gpios: true
> > +  te-gpios: true
> > +  backlight: true
> > +
> > +additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - port
> > +  - reg
> > +
> > +examples:
>
> My personal preference is indent 4 spaces.
> But there is no hard rule so do what you like.
> 
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    dsi-controller {
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +
> > +      port {
> > +        dsi1_out_ep: endpoint {
> > +          remote-endpoint = <&lcd0_in>;
> > +          lanes = <0 1 2 3 4 5>;
> > +        };
> > +      };
> 
> Addding the port node here does not really help me,
> I was left confused about the lanes = <...> property.
> 
> > +
> > +      panel@0 {
> > +        compatible = "tpo,taal", "panel-dsi-cm";
> > +        label = "lcd0";
> 
> This use of label does not really match the description.
> The description says label shall be used for specific names and not
> generic names like "lcd".
> 
> > +        reg = <0>;
> > +        reset-gpios = <&gpio4 6 GPIO_ACTIVE_HIGH>;
> > +
> > +        port {
> > +          lcd0_in: endpoint {
> > +            remote-endpoint = <&dsi1_out_ep>;
> > +          };
> > +        };
> > +      };
> > +
> > +    };
> 
> Add:
> <empty line>
> ...
> 
> The latter is end of statement or soething.
> You see it used often bu not always.
> 
> I expect it to become mandatory the day the tools check for it.

I have no other comment to add. Once you address the issues pointed out
by Sam, you can add my

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
