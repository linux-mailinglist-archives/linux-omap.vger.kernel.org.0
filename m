Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7FFB11BCC1
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 20:18:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbfLKTSG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 14:18:06 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41214 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbfLKTSG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Dec 2019 14:18:06 -0500
Received: by mail-lj1-f193.google.com with SMTP id h23so25324543ljc.8
        for <linux-omap@vger.kernel.org>; Wed, 11 Dec 2019 11:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=newoldbits-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PUVn6x+YmbLcVEGS+44vGZB1xImdawS2bJb4bjzB/Lo=;
        b=d0Wtr6CEP2m8c26QMdPD3e7CCan6DC6h8yp6G19dle2Emr5AL5IkVH4cHqqvuIwnPW
         ySJGJv5GWqK05mtTfWD48L9/dzwfodaAn1vSCIjmtbR6mFi94khuxp57veQwz8xkluzO
         y+9TAXWCxvLKnNSqmcD09j4Xv323mVOZMVetUZk6aYJbhKbH0KlE7tsFBz6Il9vHLBa4
         k6VJpDdkx1UCewkmahPD1D7qjROoTV0s+NYcaT9T20Ia+NnWk9/hPSCBDxQ20ilV7uXX
         2UAkmPt5HUjghpLdj74kYCkDigPeCmFOt5f6WvqTFiu1R46O4hacqFHISK3EntGNOViI
         gDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PUVn6x+YmbLcVEGS+44vGZB1xImdawS2bJb4bjzB/Lo=;
        b=QTSpRpJo7bYsBgQhVJ7RUhA8VqGi0UKpH0uMsgdDOkypFR285Cw++zlw4KozmOBAKW
         CaEDHlx6N98ep/iI4rL1syzdoLJYBnAA3WZw2c4xUfqC2WKQEEf3wBV4q1irLiUKJvNu
         yCxPapYIlxcXBO7GrJ29xmKUrTpGcBY9QHGQWxDFKeRlirJkxdB8Yy2jv7CuIHPP40Ap
         BYJGWiSqyhUzcsaiM2g5y+BGWOvzalSEubi7WsVsSeYY5VnFVCxSqytSqNtr509xTpAt
         aAzKu7HC98jaOlC+7xC9znOJOa8pgR0soDZ4Pc5lDP4uXDXVyQAr1/O8hsVeATZX9igq
         wF8g==
X-Gm-Message-State: APjAAAVdhEJ4+7LQSAIAyjJFpSUVbghfC7hINumaZEbrU8vT8PTYMZ7S
        I88tkueQFfsjMu75acgb3aV4oRCCHhz61YBBbmv19tGckKSZug==
X-Google-Smtp-Source: APXvYqyjKbPaI3zT1yZniEuJJBcMQJnIP0RzCBZN0kh76f1QePOZ8LdtNvtzNT5Z+C7I7Y5gQOZshIEymKcgEVhyhJg=
X-Received: by 2002:a2e:95c4:: with SMTP id y4mr3365973ljh.38.1576091884795;
 Wed, 11 Dec 2019 11:18:04 -0800 (PST)
MIME-Version: 1.0
References: <20191210215831.6199-1-tony@atomide.com> <20191210215831.6199-2-tony@atomide.com>
In-Reply-To: <20191210215831.6199-2-tony@atomide.com>
From:   Jean Pihet <jean.pihet@newoldbits.com>
Date:   Wed, 11 Dec 2019 20:17:53 +0100
Message-ID: <CAORVsuXXtCroRbXS0wBtkDqnefxtCJMG0+t7LG5AWtWvwrObQA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: OMAP2+: Drop legacy platform data for am4 qspi
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Tony,

On Tue, Dec 10, 2019 at 10:58 PM Tony Lindgren <tony@atomide.com> wrote:
>
> We can now probe devices with ti-sysc interconnect driver and dts
> data. Let's drop the related platform data and custom ti,hwmods
> dts property.
>
> As we're just dropping data, and the early platform data init
> is based on the custom ti,hwmods property, we want to drop both
> the platform data and ti,hwmods property in a single patch.

Tested OK on AM4376 QSPI. The correct fck is found and the hwmod
warning is gone.
Acked-by: Jean Pihet <jean.pihet@newoldbits.com>

Thanks!
Jean

>
> Cc: Jean Pihet <jean.pihet@newoldbits.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  arch/arm/boot/dts/am4372.dtsi              |  1 -
>  arch/arm/mach-omap2/omap_hwmod_43xx_data.c | 34 ----------------------
>  2 files changed, 35 deletions(-)
>
> diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
> --- a/arch/arm/boot/dts/am4372.dtsi
> +++ b/arch/arm/boot/dts/am4372.dtsi
> @@ -307,7 +307,6 @@ gpmc: gpmc@50000000 {
>
>                 target-module@47900000 {
>                         compatible = "ti,sysc-omap4", "ti,sysc";
> -                       ti,hwmods = "qspi";
>                         reg = <0x47900000 0x4>,
>                               <0x47900010 0x4>;
>                         reg-names = "rev", "sysc";
> diff --git a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
> --- a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
> +++ b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
> @@ -315,32 +315,6 @@ static struct omap_hwmod am43xx_usb_otg_ss1_hwmod = {
>         },
>  };
>
> -static struct omap_hwmod_class_sysconfig am43xx_qspi_sysc = {
> -       .rev_offs       = 0,
> -       .sysc_offs      = 0x0010,
> -       .sysc_flags     = SYSC_HAS_SIDLEMODE,
> -       .idlemodes      = (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
> -                               SIDLE_SMART_WKUP),
> -       .sysc_fields    = &omap_hwmod_sysc_type2,
> -};
> -
> -static struct omap_hwmod_class am43xx_qspi_hwmod_class = {
> -       .name   = "qspi",
> -       .sysc   = &am43xx_qspi_sysc,
> -};
> -
> -static struct omap_hwmod am43xx_qspi_hwmod = {
> -       .name           = "qspi",
> -       .class          = &am43xx_qspi_hwmod_class,
> -       .clkdm_name     = "l3s_clkdm",
> -       .main_clk       = "l3s_gclk",
> -       .prcm = {
> -               .omap4 = {
> -                       .clkctrl_offs = AM43XX_CM_PER_QSPI_CLKCTRL_OFFSET,
> -                       .modulemode   = MODULEMODE_SWCTRL,
> -               },
> -       },
> -};
>
>  /*
>   * 'adc/tsc' class
> @@ -681,13 +655,6 @@ static struct omap_hwmod_ocp_if am43xx_l3_s__usbotgss1 = {
>         .user           = OCP_USER_MPU | OCP_USER_SDMA,
>  };
>
> -static struct omap_hwmod_ocp_if am43xx_l3_s__qspi = {
> -       .master         = &am33xx_l3_s_hwmod,
> -       .slave          = &am43xx_qspi_hwmod,
> -       .clk            = "l3s_gclk",
> -       .user           = OCP_USER_MPU | OCP_USER_SDMA,
> -};
> -
>  static struct omap_hwmod_ocp_if am43xx_dss__l3_main = {
>         .master         = &am43xx_dss_core_hwmod,
>         .slave          = &am33xx_l3_main_hwmod,
> @@ -783,7 +750,6 @@ static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
>         &am43xx_l4_wkup__smartreflex1,
>         &am43xx_l4_wkup__timer1,
>         &am43xx_l4_wkup__adc_tsc,
> -       &am43xx_l3_s__qspi,
>         &am33xx_l4_per__dcan0,
>         &am33xx_l4_per__dcan1,
>         &am33xx_l4_ls__timer2,
> --
> 2.24.0
