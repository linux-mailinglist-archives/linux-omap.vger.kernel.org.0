Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7196CB162
	for <lists+linux-omap@lfdr.de>; Thu,  3 Oct 2019 23:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732520AbfJCVkj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Oct 2019 17:40:39 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:44933 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387660AbfJCVkj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 3 Oct 2019 17:40:39 -0400
Received: by mail-io1-f67.google.com with SMTP id w12so8973496iol.11;
        Thu, 03 Oct 2019 14:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iD1EF6O5uYyPHk2lyyhowDbuFGVloB10aGSek27Khvs=;
        b=choTNLqb+I3qLscd/IawY0fhTpWqLowAeelSwP4Rv1g6S/K/M5xobirmLd7GvBs63i
         iuqRncniILwSTQojjX9CyA6LOQyYUl1dAU4LAqvxGrUsld5REzhsNdql4vyPlOALtUkD
         5cTRIc/HXPi0n3ZJdlmVqTN3NVmEGY1sbhqRR8FurekpH87nqhzH4JUzIb/K3JXVQi6c
         hR436JlA1x0Yuf/aiHxohOouxN0EXg7k60q9Y5v1WG35lU/wpM1i+ESp3XH3VeBolSFB
         XIR8wqjpBufBc5gkCWexSFlKJgeUB6FtT3HP3w+6L27rtBUrqwU1Qkr0jaTlUVm+pH5P
         jhNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iD1EF6O5uYyPHk2lyyhowDbuFGVloB10aGSek27Khvs=;
        b=VGr2dPRx7Uy4E4qarngwbwMcohtYFSfxL/lkB+1xloGr+gDMqYNqqrrr6L3UJGRQy1
         RmEYIWzQOF7+3Gw7lSvAU3B+MHcEf6drB16fC0O2wQNzbxYQNSX9uGkjkgX5engU0Ce1
         6afQ+L09cEOykz2wmFbGU9wijMu76C9sBhs+auIIAfYe50YuhjMh3H2nVUrt8X0Lc656
         2D/pTArVZO1ugPMo6lxiO9FhBoUMK0ZSXP/qGbxsCl/TYQXloJyuI7NN1lwVKdePBUVo
         htFbouwYe8CaWEhE4sOn2CERHaYUsWaY35mEGBXxTYJOVOMA+F+E6jZBiRZaIlYWjuiX
         ZjCQ==
X-Gm-Message-State: APjAAAUIDKXer286MhQGDsE3K1NwaKzbdMNHuVr93T2Z+yLQArG9yn0O
        5KkryHVKapeKw3I5lgTv+PACETuH2WbI3r/GRtg=
X-Google-Smtp-Source: APXvYqz/ulXmgBkkmsry2kLhehSjSGtf79MsHLivqOKLdZrTZeZSQy7E58b3R05cg6bkk+txtvjVB/CD70GbVGE+bok=
X-Received: by 2002:a92:d84d:: with SMTP id h13mr12392064ilq.205.1570138837800;
 Thu, 03 Oct 2019 14:40:37 -0700 (PDT)
MIME-Version: 1.0
References: <20191003134147.9458-1-sre@kernel.org> <20191003134147.9458-2-sre@kernel.org>
In-Reply-To: <20191003134147.9458-2-sre@kernel.org>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 3 Oct 2019 16:40:26 -0500
Message-ID: <CAHCN7xLtHcU6q8_dorZOySPaQATce9qbvzcK1Tn0MoEF+tURHA@mail.gmail.com>
Subject: Re: [PATCHv2 1/4] ARM: dts: LogicPD Torpedo: Add WiLink UART node
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Tony Lindgren <tony@atomide.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Oct 3, 2019 at 8:42 AM Sebastian Reichel <sre@kernel.org> wrote:
>
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
>
> Add a node for the UART part of WiLink chip.
Thank you.

hci0:   Type: Primary  Bus: UART
        BD Address: 00:18:30:49:7D:63  ACL MTU: 1021:4  SCO MTU: 180:4
        UP RUNNING
        RX bytes:6185 acl:0 sco:0 events:581 errors:0
        TX bytes:91006 acl:0 sco:0 commands:578 errors:0

>
> This is compile tested only!
>
I am not sure which is more appropriate,

Acked-by: Adam Ford <aford173@gmail.com>
Tested-by: Adam Ford <aford173@gmail.com>

> Cc: Adam Ford <aford173@gmail.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts b/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts
> index 18c27e85051f..c34ba0ef8b4d 100644
> --- a/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts
> +++ b/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts
> @@ -50,6 +50,14 @@
>         };
>  };
>
> +&uart2 {
> +       bluetooth {
> +               compatible = "ti,wl1283-st";
> +               enable-gpios = <&gpio6 2 GPIO_ACTIVE_HIGH>; /* gpio 162 */
> +               max-speed = <3000000>;
> +       };
> +};
> +
>  &omap3_pmx_core {
>         mmc3_pins: pinmux_mm3_pins {
>                 pinctrl-single,pins = <
> --
> 2.23.0
>
