Return-Path: <linux-omap+bounces-5341-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3913CF7742
	for <lists+linux-omap@lfdr.de>; Tue, 06 Jan 2026 10:18:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70F5E30A32C3
	for <lists+linux-omap@lfdr.de>; Tue,  6 Jan 2026 09:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1DCF30AD10;
	Tue,  6 Jan 2026 09:14:07 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5E527C84B
	for <linux-omap@vger.kernel.org>; Tue,  6 Jan 2026 09:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767690847; cv=none; b=PFlDE3X/3Yg7Jdewpi5fEILwaQhV9vBs+XdfqQeohpDctYhwL75TkO9Ep15Ep214JcRBXHyG+rsY0M4IKouUcNU5se/k7Vs0w9oJ8nD8h1ykxWnOLPoTPCcigW69jcPfDIbOd+HZxbUBLYDhPtGLK96LoEkXB/tKEcuHDWP089w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767690847; c=relaxed/simple;
	bh=oGWEDzx0GCta1OvN+DPAb0Ri8GEUryM+YKckFtZpRpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i0XSg0UBFp6+09eGaDPSZcZDzhWsy/VsOxanJwS5TXSlzeseO+V5p7rL2+VNVrVQGmn3jow95XHijQWbEqBHXPS/pdIk9gQP1Vc4BwDNsJJvgARsCz06PmeTdpPDRyu9LSWJUpH0YxIlD8h9dH06k+H9FpXmwtA8y8pKaT/LUvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5dbcd54d2d8so552450137.2
        for <linux-omap@vger.kernel.org>; Tue, 06 Jan 2026 01:14:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690845; x=1768295645;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWrr+aouVwIROBpBmJECMnG33Dep8i0hbCwAaVkq1R0=;
        b=bFHk1FjG2b5IrWDtfUAhT1T//+4GvMBlDE4CpSNvQ6mPN2lgckLZBNQ/y3yDpv5Qsp
         xv1DcGR7RXW5Y+8S6RE43BOopBfK2uliaTbCy4y5AANMGEaFBxbsyvw9UpLn69EOFUHF
         I+BFdItW+Yym4Q0MLKmfrb2aXXPyAByTKcRkr9LUpBzQEGyH37DimWkYOGzTzsTypWeq
         asDF59PF29URpRtuWZo/tO53kSSo2QO49UrQwHN4hDsUDPfmznvTY012bqRD7J69oEua
         hvr0+01F2b4U4frmi3PVjsNGO0vwJAHhm8/SbtVT9j+Et1Zf95jGyvTN9xN7XMa5mPit
         qCvA==
X-Forwarded-Encrypted: i=1; AJvYcCXS2HeX4b05dWpzniew3EVkUaXAIgpT99CVFhnreUdj/qVCXe2YtH1tUQte7BBCTZRh2HY/XILtFVf0@vger.kernel.org
X-Gm-Message-State: AOJu0YypLw8hnpmG7u7PSlAh+jOnr0/kDmLnHTW8tJOgwnqYzMby6MxX
	HeG6qLwkcLO9X8cCW82of1G2QAkBB4moOiotNDTssxKoB37qygcF5voF23xcCioO
X-Gm-Gg: AY/fxX52SK6h7R40mqTNQIKkms+P0i7qLXeYyrWjh6axRbdIhFhF/LkxAxwxV3nG3tU
	YzE+drOyP+L7s1HOiRFJAx0NwqU8EU0//IUefbLEhkRUXVobrhqowrFXLlMW6bfpHCAJKhMS9bU
	3O6LYi4U4m8FgYpObCtlmuvTO4Sl5BKCDtLw41/HSQw/BORxuZuQGVNAiGWknYiJzmRGm4DTubr
	hNQXb74c05jVYnRrvy4VcrsJNfFSAB7EH+DFDJsoUAZiLx/mmC8YyTRWDTTflnIHphiI7rN2W/w
	v24naw63/3/N7mSs+2Xp7GfC71+F/j8lCTr5enZsfWv8iOoc7TclZr7yKsEI7ea/uO4sHqPVaCN
	UdubjElhrSWs1HwPfHe7eQlmxjlYVCpa2zTonHszRvZqKS+w1wYrvXIJ6BTZVG989jnBanj+jA7
	cdCFFfWgsgzuH7pP9M03G80Vdc3gUhucB0XfyVZ6sCZ0/CO2VAKBiI
X-Google-Smtp-Source: AGHT+IGs726ZG7/cS8Y0ZYp8HCxPswLKzVRuZYvRb85Na/Txj1lfneyGTVk5BtF0Pc4I3F2RxnNqHw==
X-Received: by 2002:a05:6102:2ad1:b0:5db:fddb:3155 with SMTP id ada2fe7eead31-5ec74400dcfmr692227137.17.1767690844643;
        Tue, 06 Jan 2026 01:14:04 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec772afecasm469683137.11.2026.01.06.01.14.03
        for <linux-omap@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 01:14:03 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5597a426807so494643e0c.2
        for <linux-omap@vger.kernel.org>; Tue, 06 Jan 2026 01:14:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX3R/CEDUaB+p5lZMC9P7/oarf+QAfNheikshL5jifWRUI4fu8Wo992pb5w5vbsSvxQq2tSVwZV0NuT@vger.kernel.org
X-Received: by 2002:a05:6102:6a92:b0:5df:b31d:d5ce with SMTP id
 ada2fe7eead31-5ec74524009mr734718137.28.1767690842994; Tue, 06 Jan 2026
 01:14:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com> <20251223-i2c-adap-dev-config-v1-6-4829b1cf0834@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-adap-dev-config-v1-6-4829b1cf0834@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Jan 2026 10:13:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW5ffiW_vEuDjV5bnmTeduhoqph7t8rsaFEVO7RXOM8jg@mail.gmail.com>
X-Gm-Features: AQt7F2rMrz4VfFE8hOXFGnfaW6TUCM_pC_Fx6Bfylmm0kWFPuXvkE1g4WrvoTA4
Message-ID: <CAMuHMdW5ffiW_vEuDjV5bnmTeduhoqph7t8rsaFEVO7RXOM8jg@mail.gmail.com>
Subject: Re: [PATCH 06/12] i2c: rcar: set device parent and of_node through
 the adapter struct
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Tue, 23 Dec 2025 at 11:05, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Configure the parent device and the OF-node using dedicated fields in
> struct i2c_adapter and avoid dereferencing the internal struct device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks for your patch!

> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -1149,8 +1149,8 @@ static int rcar_i2c_probe(struct platform_device *pdev)
>         adap->algo = &rcar_i2c_algo;
>         adap->class = I2C_CLASS_DEPRECATED;
>         adap->retries = 3;
> -       adap->dev.parent = dev;
> -       adap->dev.of_node = dev->of_node;
> +       adap->parent = dev;
> +       adap->of_node = dev->of_node;
>         adap->bus_recovery_info = &rcar_i2c_bri;
>         adap->quirks = &rcar_i2c_quirks;
>         i2c_set_adapdata(adap, priv);

    [....]
    ret = rcar_i2c_clock_calculate(priv);
    [...]
    ret = i2c_add_numbered_adapter(adap);

As rcar_i2c_clock_calculate() uses rcar_i2c_priv_to_dev(priv):

    #define rcar_i2c_priv_to_dev(p)         ((p)->adap.dev.parent)

I believe this will deference dev.parent before it is initialized by
the newly added code in i2c_register_adapter().

Let's check...

    Unable to handle kernel NULL pointer dereference at virtual
address 0000024c when read
    [0000024c] *pgd=80000040004003, *pmd=00000000
    Internal error: Oops: 206 [#1] SMP ARM
    Modules linked in:
    CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted
6.19.0-rc3-koelsch-04401-g9e22366a23cd #2288 NONE
    Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
    PC is at device_property_read_u32_array+0x0/0x14
    LR is at i2c_parse_timing+0x14/0x30
    [...]
    Call trace:
     device_property_read_u32_array from i2c_parse_timing+0x14/0x30
     i2c_parse_timing from i2c_parse_fw_timings+0x28/0x12c
     i2c_parse_fw_timings from rcar_i2c_probe+0x1cc/0x534
     rcar_i2c_probe from platform_probe+0x58/0x90

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

