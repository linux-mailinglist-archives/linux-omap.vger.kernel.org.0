Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06D48D1CD7
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2019 01:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732017AbfJIXbc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 19:31:32 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:45869 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731166AbfJIXbc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Oct 2019 19:31:32 -0400
Received: by mail-oi1-f194.google.com with SMTP id o205so3269951oib.12;
        Wed, 09 Oct 2019 16:31:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=To7sz3Pj+9D426NllUrSBfEbVe/N6dxbVkGeiJMXZFI=;
        b=J/cwbmkpp4pJ6kB+Z54PiDTwxQUdVBzWvrdvpWB6ldJwMUBW+TdC4WZ2/DdbYB6PlC
         cTxy6+NotPwEYcOzhoK3d1jAXLvUO3RkaKRAIwuiwyx7kpWymBMpiD6D8ne5vKqaWAGn
         TM99gZmMPxbtYznxlaAMmQlgzSjmFFrO6gOduUoLgTST8xMm5hFcIu8YnRpdFnJDhDjm
         p+2iVQT+jM8saX52nJ2XEBESlsdNJUKB/huJ5+iz0wsq7lkoflbaN6IftErWPo5KvZno
         F08wpL92wA22Au8eCmGZs8f16bGHXM3KlFahjxWJP5/kLVN2pY+ZUWXSpCOYwwOwdX88
         anSg==
X-Gm-Message-State: APjAAAVLedvVrBHljoEn4q5JuAwPEBDPhFDjvL3frr26YZ2v0zqhx59O
        eT1irv9IC6mcQwB8JwD1GJ+g89w=
X-Google-Smtp-Source: APXvYqxdZH4Yv74xeDd6uJYTvrlMrf1KIaK0glfrQqoyHvMw957Vce44h0eFAO0IDUshuR+cc81VWA==
X-Received: by 2002:a05:6808:689:: with SMTP id k9mr4959453oig.117.1570663891350;
        Wed, 09 Oct 2019 16:31:31 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r7sm1125101oih.41.2019.10.09.16.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 16:31:30 -0700 (PDT)
Date:   Wed, 9 Oct 2019 18:31:30 -0500
From:   Rob Herring <robh@kernel.org>
To:     Adam Ford <aford173@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        adam.ford@logicpd.com, Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 2/3] dt-bindings: Add Logic PD Type 28 display panel
Message-ID: <20191009233130.GA1002@bogus>
References: <20191001233923.16514-1-aford173@gmail.com>
 <20191001233923.16514-5-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191001233923.16514-5-aford173@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Oct 01, 2019 at 06:39:22PM -0500, Adam Ford wrote:
> This patch adds documentation of device tree bindings for the WVGA panel
> Logic PD Type 28 display.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
> V4:  Update per Rob H's suggestions and copy other panel yaml example from 5.4-rc1
> V3:  Correct build errors from 'make dt_binding_check'

The example still fails to build here.

> V2:  Use YAML instead of TXT for binding
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/logicpd,type28.yaml b/Documentation/devicetree/bindings/display/panel/logicpd,type28.yaml
> new file mode 100644
> index 000000000000..e2c62e8f1db4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/logicpd,type28.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/logicpd,type28.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Logic PD Type 28 4.3" WQVGA TFT LCD panel
> +
> +maintainers:
> +  - Adam Ford <aford173@gmail.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: logicpd,type28
> +
> +  power-supply: true
> +  enable-gpios: true
> +  backlight: true
> +  port: true
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    lcd0: display {
> +      compatible = "logicpd,type28";
> +      enable-gpios = <&gpio5 27 GPIO_ACTIVE_HIGH>;
> +      backlight = <&backlight>;
> +      port {
> +        lcd_in: endpoint {
> +          remote-endpoint = <&dpi_out>;
> +        };
> +      };
> +    };
> +
> +...
> -- 
> 2.17.1
> 
