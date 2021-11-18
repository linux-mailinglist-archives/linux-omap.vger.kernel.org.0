Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23EDB455707
	for <lists+linux-omap@lfdr.de>; Thu, 18 Nov 2021 09:34:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244570AbhKRIhC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 18 Nov 2021 03:37:02 -0500
Received: from mail-vk1-f178.google.com ([209.85.221.178]:43905 "EHLO
        mail-vk1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231745AbhKRIg7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 18 Nov 2021 03:36:59 -0500
Received: by mail-vk1-f178.google.com with SMTP id f7so3314221vkf.10;
        Thu, 18 Nov 2021 00:33:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZHqYNDJJeUEUo7A1lpPpFJOTlOxuy2hnNwzoc1obFj4=;
        b=oBS12w+9eoB+GNK5ttaheySAoQCi5//SWrMXplOzeMxA2iLOEtHROkDKhmy9KOEups
         QY+Br51pQc1iTBVUdSLcUHeY4w4/cD84JFzzkYaILeNY4XuV1eVGlF/IY3EmwdlTM2EX
         B8zsLhD5Ydz+1pyJaway/rZUchv7O2nLYMZ+eLjGGnsrg8NVfGvCaSdUytb0/YSv8O8B
         U1zU9NcyznDONM/HlZfrZE1cOkvYfZHEN6COp7+gz1/4PgVEhnQOBQ3u0azawlIJNQAl
         KgPrnYddatJVJ6ZEf5xdNhqFKZLaezkw/Y1vYQ2FZ/HFEFjRORxKB5DSNmx1WY0v3enK
         JACg==
X-Gm-Message-State: AOAM533lq04oRS1U+BtW9JWXd8rFbPsOs96AaFhomQUfAIVLG2A0j6if
        MM51zapppiHezV0U5WGBINpZGmQoxSKuWw==
X-Google-Smtp-Source: ABdhPJw9zNRA1CPsFkP107X/6FhORafVKbRo6lA4KacCUoDjaNiz5H76ur4ROy1DEjGph3EDGz+vuQ==
X-Received: by 2002:a05:6122:2158:: with SMTP id m24mr33991798vkd.1.1637224439099;
        Thu, 18 Nov 2021 00:33:59 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id c21sm1238238vso.21.2021.11.18.00.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 00:33:58 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id i6so11962945uae.6;
        Thu, 18 Nov 2021 00:33:57 -0800 (PST)
X-Received: by 2002:a05:6102:e82:: with SMTP id l2mr78426134vst.37.1637224437450;
 Thu, 18 Nov 2021 00:33:57 -0800 (PST)
MIME-Version: 1.0
References: <20211117121829.11141-1-guozhengkui@vivo.com>
In-Reply-To: <20211117121829.11141-1-guozhengkui@vivo.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Nov 2021 09:33:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWxSBSb0zA=_Httx53ocJ5qtKUHArq_+pCAWKB9ppzn1g@mail.gmail.com>
Message-ID: <CAMuHMdWxSBSb0zA=_Httx53ocJ5qtKUHArq_+pCAWKB9ppzn1g@mail.gmail.com>
Subject: Re: [PATCH] video: omapfb: Use scnprintf() instead of snprintf()
To:     Guo Zhengkui <guozhengkui@vivo.com>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        "open list:OMAP FRAMEBUFFER SUPPORT" <linux-fbdev@vger.kernel.org>,
        "open list:OMAP FRAMEBUFFER SUPPORT" <linux-omap@vger.kernel.org>,
        "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>, kernel@vivo.com,
        Julia Lawall <Julia.Lawall@inria.fr>,
        Gilles Muller <Gilles.Muller@inria.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>, cocci@inria.fr
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Guo,

CC cocci

On Wed, Nov 17, 2021 at 1:58 PM Guo Zhengkui <guozhengkui@vivo.com> wrote:
> Fix following warnings:
> ./drivers/video/fbdev/omap/omapfb_main.c:1382:8-16:
> WARNING: use scnprintf or sprintf
> ./drivers/video/fbdev/omap/omapfb_main.c:1306:8-16:
> WARNING: use scnprintf or sprintf
>
> Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>

Thanks for your patch!

> --- a/drivers/video/fbdev/omap/omapfb_main.c
> +++ b/drivers/video/fbdev/omap/omapfb_main.c
> @@ -1303,7 +1303,7 @@ static ssize_t omapfb_show_panel_name(struct device *dev,
>  {
>         struct omapfb_device *fbdev = dev_get_drvdata(dev);
>
> -       return snprintf(buf, PAGE_SIZE, "%s\n", fbdev->panel->name);
> +       return scnprintf(buf, PAGE_SIZE, "%s\n", fbdev->panel->name);
>  }

I guess all of these should use sysfs_emit() instead.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
