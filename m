Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1526355913
	for <lists+linux-omap@lfdr.de>; Tue, 25 Jun 2019 22:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727510AbfFYUkl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 Jun 2019 16:40:41 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:60368 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbfFYUkl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 25 Jun 2019 16:40:41 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 32B4C2002F;
        Tue, 25 Jun 2019 22:40:38 +0200 (CEST)
Date:   Tue, 25 Jun 2019 22:40:36 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, tomi.valkeinen@ti.com,
        imirkin@alum.mit.edu, marek.belisko@gmail.com,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH v3 4/5] dt-bindings: drm/panel: simple: add ortustech,
 com37h3m99dtc panel
Message-ID: <20190625204036.GD18595@ravnborg.org>
References: <cover.1559905870.git.hns@goldelico.com>
 <3e0720fbddfd7b35ad8551440544411485d8ad9f.1559905870.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e0720fbddfd7b35ad8551440544411485d8ad9f.1559905870.git.hns@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=ztCEdXhiAAAA:8
        a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=TaQvIJAheEgyp50s76YA:9
        a=CjuIK1q_8ugA:10 a=nCm3ceeH17rKjHWsMeRo:22 a=E9Po1WZjFZOl8hwRPBS3:22
        a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jun 07, 2019 at 01:11:10PM +0200, H. Nikolaus Schaller wrote:
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/ortustech,com37h3m99dtc.txt        | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/ortustech,com37h3m99dtc.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/ortustech,com37h3m99dtc.txt b/Documentation/devicetree/bindings/display/panel/ortustech,com37h3m99dtc.txt
> new file mode 100644
> index 000000000000..06a73c3f46b5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/ortustech,com37h3m99dtc.txt
> @@ -0,0 +1,12 @@
> +OrtusTech COM37H3M99DTC Blanview 3.7" VGA portrait TFT-LCD panel
> +
> +Required properties:
> +- compatible: should be "ortustech,com37h3m99dtc"
> +
> +Optional properties:
> +- enable-gpios: GPIO pin to enable or disable the panel
> +- backlight: phandle of the backlight device attached to the panel
> +- power-supply: phandle of the regulator that provides the supply voltage
> +
> +This binding is compatible with the simple-panel binding, which is specified
> +in simple-panel.txt in this directory.
> -- 
> 2.19.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
