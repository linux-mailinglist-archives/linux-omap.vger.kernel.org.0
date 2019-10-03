Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7BDFCB256
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2019 01:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731762AbfJCXdS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Oct 2019 19:33:18 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:43619 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731688AbfJCXdS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 3 Oct 2019 19:33:18 -0400
Received: by mail-io1-f65.google.com with SMTP id v2so9493514iob.10
        for <linux-omap@vger.kernel.org>; Thu, 03 Oct 2019 16:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m6O0pnq2oyj3veYP2+PDWkz00eb6bzEkIgWUSNJ66BA=;
        b=U68COWHPNR4rYajOb/D3ZMXj8slbIBgWEn7UzL8SkPPwEcTh8P7pqfxA9jvfcg21j3
         HllTu/Xq8nFq66rPmIE4L4CyR6zDrJzaup9BnlkPS3fYGhXjZgXozpTsJYc7qapnVTp2
         dQWKWA290BOhzT7PdNuWQEIH06QLTAF4+aMdz1H52A889XAWUTJ54OeGINQARtwSwn45
         ImRQ0wjQSQxzWVcDxRtm41Hj7WU7PPpR3150+HVPfoeVF9m89VNbyRzMRaZq2kYgD7ZD
         DUV7kOJKcVgZX8cQ6fgQr4guGwr+9njpdKOYg3F9Ivl0ywvS0D9UKigMLtJAY1mBliTh
         7HQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m6O0pnq2oyj3veYP2+PDWkz00eb6bzEkIgWUSNJ66BA=;
        b=dafMcdKQMQmM8Lw4OiIcLC8wmizrtTd2CPRFV96mNAqBNOcIUWPCtntHACtR6Sq1fC
         QBbgBFXfVMWGTCT36yTzlfN1XtKKLTTtqCOcXaXySO8feIeiWUcXnOhQOpkp8ykNUD9e
         zVgQsM24db/VdBA6Grog9eh8kdhQ7QTJhGyIHWTuv7CAxBSkJCMNKl+yA9BvtAsd1Gcz
         236bVZBd7z3ZxReNwwmnsV404et2XKixcVSzskD4cXJ3+oQ+liVEJH8CMHswLKptc2L4
         NQYVbmcn8zHJXrKAk8IqAFIz+zAd+4bDAukmYRK6pEQQHuLFA78a30MX+e/sDUnI5QK3
         hPYA==
X-Gm-Message-State: APjAAAUttCZw6CJSO08EZOQ5hKPIVF4Aq4ckbZIFGxyqsO1gGOG+rRU4
        96xE6a9Iwrf/qCLUr/OLT7n5Slj3lMg6S2C+5cmApA==
X-Google-Smtp-Source: APXvYqzXndeSwf4RQV9jBgJVLPljLCoYPyPgo6je+pGkU/dLPBiBVu1ZxNDs+5fO1IwBgRroiV7Adb641wDVqVKJMFM=
X-Received: by 2002:a92:3f0a:: with SMTP id m10mr12320611ila.158.1570145596497;
 Thu, 03 Oct 2019 16:33:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190816225812.14301-1-aford173@gmail.com>
In-Reply-To: <20190816225812.14301-1-aford173@gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 3 Oct 2019 18:33:05 -0500
Message-ID: <CAHCN7x+xqarvou+0TOBDTEjQZnX_UCED8UTvJh=VYkRak6SN_A@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: logicpd-torpedo-som: Remove twl_keypad
To:     Linux-OMAP <linux-omap@vger.kernel.org>
Cc:     Adam Ford <adam.ford@logicpd.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Aug 16, 2019 at 5:58 PM Adam Ford <aford173@gmail.com> wrote:
>
> The TWL4030 used on the Logit PD Torpedo SOM does not have the
> keypad pins routed.  This patch disables the twl_keypad driver
> to remove some splat during boot:
>
> [    5.902221] twl4030_keypad 48070000.i2c:twl@48:keypad: missing or malformed property linux,keymap: -22
> [    5.911773] twl4030_keypad 48070000.i2c:twl@48:keypad: Failed to build keymap
> [    5.918975] twl4030_keypad: probe of 48070000.i2c:twl@48:keypad failed with error -22
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Tony,

Any chance this can get accepted?

adam
>
> diff --git a/arch/arm/boot/dts/logicpd-torpedo-som.dtsi b/arch/arm/boot/dts/logicpd-torpedo-som.dtsi
> index 3fdd0a72f87f..506b118e511a 100644
> --- a/arch/arm/boot/dts/logicpd-torpedo-som.dtsi
> +++ b/arch/arm/boot/dts/logicpd-torpedo-som.dtsi
> @@ -192,3 +192,7 @@
>  &twl_gpio {
>         ti,use-leds;
>  };
> +
> +&twl_keypad {
> +       status = "disabled";
> +};
> --
> 2.17.1
>
