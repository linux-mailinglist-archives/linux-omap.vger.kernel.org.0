Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC2A803EF
	for <lists+linux-omap@lfdr.de>; Sat,  3 Aug 2019 04:12:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393006AbfHCCMY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 2 Aug 2019 22:12:24 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38079 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391637AbfHCCMY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 2 Aug 2019 22:12:24 -0400
Received: by mail-pg1-f196.google.com with SMTP id f5so28091530pgu.5
        for <linux-omap@vger.kernel.org>; Fri, 02 Aug 2019 19:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0+Bh9KmnXViBMy75SYIrHK8KzqIb8xEh1Les/yPtYIU=;
        b=W1XDyd/eLmCYsL4iRwwQNmX8884q9VUr17ETlif8/CAA5qV8yN8Yxp8/uLiUKbEPNp
         vu2syS8+zGaNUypp+NYuHXzYTym6ux5nVs5SJnxyww8VukcpW0nBNSaaLSWxf7I1Dme+
         5a2tj/09h2LSKXtJKOVr6H1wa6ZWVaxHdDFgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0+Bh9KmnXViBMy75SYIrHK8KzqIb8xEh1Les/yPtYIU=;
        b=ObU3HsPNKIgY+X6TDCL2QLXzuOGw7EX0brN5KZh8Ui6kjbErZLROC1odJOLhfHQvOG
         sc/LxLMrGY4KvWJHRZYKKlpHj6wn3A5OwO8uJqYszQa0jgbKCnNWvv+tGQaXf9sqVaMt
         edxTMplBP+M3YhtiGMgtDUHuEqIlxnHpUjSyE4FlQyrcAlnyk3On32Ya0sDmRielPlYW
         hSqHUMFnWGH0X2W3jipYwl6yXF0PX3k5F17CSfjOUClaxiQFL5cwRujxWkS1M+4QhmNh
         Hsdv4OrE1l0OON2gL4jba11bNrsncJSuSwMgyfwirDtygC1/rMEcZCKVEsqDeNIJuNnv
         XGaw==
X-Gm-Message-State: APjAAAUClOmZjG+UWwTQgInqapF1QJDIes9zXKDOp+oK+WNATO3knEfl
        u0CJ6OLufrwDQ/LOx+7baWuRUg==
X-Google-Smtp-Source: APXvYqxFE10Abv2h+d0F63SfhCFmdx6AtEvxbdzGAwl9Ed1nqm194Q37CBphEcFBXWnGM1oKOcN5ww==
X-Received: by 2002:a62:1616:: with SMTP id 22mr63711224pfw.120.1564798343773;
        Fri, 02 Aug 2019 19:12:23 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id g4sm91419764pfo.93.2019.08.02.19.12.22
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Aug 2019 19:12:23 -0700 (PDT)
Date:   Fri, 2 Aug 2019 19:12:22 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] video: fbdev: omapfb_main: Mark expected switch
 fall-throughs
Message-ID: <201908021912.0D14906FF9@keescook>
References: <20190802191542.GA32751@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190802191542.GA32751@embeddedor>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Aug 02, 2019 at 02:15:42PM -0500, Gustavo A. R. Silva wrote:
> Mark switch cases where we are expecting to fall through.
> 
> This patch fixes the following warning (Building: omap1_defconfig arm):
> 
> drivers/video/fbdev/omap/omapfb_main.c:449:23: warning: this statement may fall through [-Wimplicit-fallthrough=]
> drivers/video/fbdev/omap/omapfb_main.c:1549:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
> drivers/video/fbdev/omap/omapfb_main.c:1547:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
> drivers/video/fbdev/omap/omapfb_main.c:1545:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
> drivers/video/fbdev/omap/omapfb_main.c:1543:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
> drivers/video/fbdev/omap/omapfb_main.c:1540:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
> drivers/video/fbdev/omap/omapfb_main.c:1538:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
> drivers/video/fbdev/omap/omapfb_main.c:1535:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  drivers/video/fbdev/omap/omapfb_main.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
> index 90eca64e3144..702cca59bda1 100644
> --- a/drivers/video/fbdev/omap/omapfb_main.c
> +++ b/drivers/video/fbdev/omap/omapfb_main.c
> @@ -447,6 +447,7 @@ static int set_color_mode(struct omapfb_plane_struct *plane,
>  		return 0;
>  	case 12:
>  		var->bits_per_pixel = 16;
> +		/* fall through */
>  	case 16:
>  		if (plane->fbdev->panel->bpp == 12)
>  			plane->color_mode = OMAPFB_COLOR_RGB444;
> @@ -1534,20 +1535,27 @@ static void omapfb_free_resources(struct omapfb_device *fbdev, int state)
>  	case OMAPFB_ACTIVE:
>  		for (i = 0; i < fbdev->mem_desc.region_cnt; i++)
>  			unregister_framebuffer(fbdev->fb_info[i]);
> +		/* fall through */
>  	case 7:
>  		omapfb_unregister_sysfs(fbdev);
> +		/* fall through */
>  	case 6:
>  		if (fbdev->panel->disable)
>  			fbdev->panel->disable(fbdev->panel);
> +		/* fall through */
>  	case 5:
>  		omapfb_set_update_mode(fbdev, OMAPFB_UPDATE_DISABLED);
> +		/* fall through */
>  	case 4:
>  		planes_cleanup(fbdev);
> +		/* fall through */
>  	case 3:
>  		ctrl_cleanup(fbdev);
> +		/* fall through */
>  	case 2:
>  		if (fbdev->panel->cleanup)
>  			fbdev->panel->cleanup(fbdev->panel);
> +		/* fall through */
>  	case 1:
>  		dev_set_drvdata(fbdev->dev, NULL);
>  		kfree(fbdev);
> -- 
> 2.22.0
> 

-- 
Kees Cook
