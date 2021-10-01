Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1112941EFEB
	for <lists+linux-omap@lfdr.de>; Fri,  1 Oct 2021 16:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354641AbhJAOrL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 Oct 2021 10:47:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:37106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231862AbhJAOrK (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 1 Oct 2021 10:47:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A7C8F61A50;
        Fri,  1 Oct 2021 14:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633099526;
        bh=k1wtkyroAI/X6RIAmdK9+9KKFXUlS31+a7dqXS6PVZE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Gly31fMOGxkJFn8YsRHsaZQtbBu+u2chUyvsVDURkzwukARvk7xa8f3RxUrJAxD3U
         Oe4HxlrT8XPeke6guwKtJeboqdMjG4sjlqCHN37lH0bS8rnqOdGXKUwB4lutGaeDBp
         PndOYQpNDZmMILojyjDeXPeoBrRUI2uvoPCJ8Ba+dk/Q307OvdWsajglyioJ68Dfjh
         qO2earuLxM7r6LpeaSVjEjxuyqpauhq0ZXXnhkSeeg8eKnkIPmNGKVMlyS96RpUClN
         QDar5+t0LYTHDLlxF0fc5nNOGX324rx9ZIby99UF9uH5FHlCNbUAsozfDptWQMo3H3
         uGMhAQp/1unrw==
Received: by mail-ed1-f48.google.com with SMTP id g8so35841681edt.7;
        Fri, 01 Oct 2021 07:45:26 -0700 (PDT)
X-Gm-Message-State: AOAM5308wxSpNCyrofpV+MMlUQdR8hSaYFMkmlOKkhnf0h5NaCh65CYc
        8g8VS3ZcLMuKx124kMSTVgsg5djHQsUW23veYA==
X-Google-Smtp-Source: ABdhPJxdQ1eDrhv3y+ZjQjQKQhQy9k9veNqk9jIfpZB4FFZi/ssAUeofjRFKk1vkwAbCd77dMBoJBat6UYim/jojhTA=
X-Received: by 2002:a17:906:7217:: with SMTP id m23mr6561725ejk.466.1633099524990;
 Fri, 01 Oct 2021 07:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <20211001102237.4db23bff@aktux>
In-Reply-To: <20211001102237.4db23bff@aktux>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 1 Oct 2021 09:45:13 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJEKjjx7mf04wHLDqKm+enWMnYykV5d6bb9AEju_Rcz=Q@mail.gmail.com>
Message-ID: <CAL_JsqJEKjjx7mf04wHLDqKm+enWMnYykV5d6bb9AEju_Rcz=Q@mail.gmail.com>
Subject: Re: strange dtbs_check error message regarding 8250_omap.yaml +
 serdev + gnss
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Oct 1, 2021 at 3:22 AM Andreas Kemnade <andreas@kemnade.info> wrote:
>
> Hi,
>
> while doing some make dtbs_check cleanup I came across this message:
>
> /home/andi/kernel/linux/arch/arm/boot/dts/omap3-gta04a4.dt.yaml: serial@4806c000: 'gnss' does not match any of the regexes: 'pinctrl-[0-9]+'
>         From schema: /home/andi/kernel/linux/Documentation/devicetree/bindings/serial/8250_omap.yaml
>
> the corresponding snippet is this one:
>
> &uart2 {
>         pinctrl-names = "default";
>         pinctrl-0 = <&uart2_pins>;
>         gnss: gnss {
>                 compatible = "wi2wi,w2sg0004";
>                 pinctrl-names = "default";
>                 pinctrl-0 = <&gps_pins>;
>                 sirf,onoff-gpios = <&gpio5 17 GPIO_ACTIVE_HIGH>;
>                 lna-supply = <&vsim>;
>                 vcc-supply = <&ldo_3v3>;
>         };
> };
>
>
> I see a pattern for serdev objects in
> Documentation/devicetree/bindings/serial/serial.yaml
>
> patternProperties:
>   ".*":
>     if:
>       type: object
>     then:
>       description:
>         Serial attached devices shall be a child node of the host UART device
>         the slave device is attached to. It is expected that the attached
>         device is the only child node of the UART device. The slave device node
>         name shall reflect the generic type of device for the node.
>
>
> so I would say, everything is allowed. serial.yaml is referenced by
> 8250_omap.yaml. So what is the problem here?

8250_omap.yaml probably has 'additionalProperties: false'. The problem
with additionalProperties is it can't see into the $ref to
serial.yaml. The fix is to use 'unevaluatedProperties' instead. Note
that it currently is a nop, so don't expect to get any failures.
Support for unevaluatedProperties was just released in jsonschema
yesterday, so dtschema will support it very soon.

Rob
