Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72BC72F05B9
	for <lists+linux-omap@lfdr.de>; Sun, 10 Jan 2021 07:35:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725846AbhAJGe6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 10 Jan 2021 01:34:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725785AbhAJGe6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 10 Jan 2021 01:34:58 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5A6CC061786;
        Sat,  9 Jan 2021 22:34:17 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id c22so10438694pgg.13;
        Sat, 09 Jan 2021 22:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0lw4V/PtYGO4Uy5ZvtsYtEZivp3HERWFm8u7jUYXH/I=;
        b=r1gV53lVhcsPtK04ZQcjlxCjs3PZHpji1sctKE273MrbLOUKsEix9/h7oGUI43UQNq
         Ju20gqMUM9v4PDWgJ6/67RtVzac0A73uX49slX4GJRTxWKmJpQS4w1d2vZ9cl7J6AZ15
         CLepj+zVWwoqbghSSJaO/vGUZzNFNexCGR7sbbKdv3LeKLWfWaml7XmFcp/jZufiFWLH
         YK7yHmKsxUEjcxbFKInNRkCpt0MVTspvmilbcnSu/4ysF7LsqD8tVQujWyQvRAzOozsT
         /vtikIzZWQLFHve8C7O+WQddjpSAizrq4T8a9P/KlsNot+XY7u+9aFpKTfQDqixZ8ldJ
         4VNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0lw4V/PtYGO4Uy5ZvtsYtEZivp3HERWFm8u7jUYXH/I=;
        b=tgRm1tdMWKezoyuY8ZAKertnfbC/c8TROUkdzTk6vbbzykXKaT9SaEcu8G+yFr3ubq
         An6YHAKL2B+lcuoHWjxSwN8t4tZ/zQdiME2l669RHvMeJMm3atnrz8SeG/8tK/n7pSNS
         oBmQMZByjAwA/uT0pdp1hke0ba5weGoA2xPwLdt2gLcFsHAXXpScIhELt4Ff1cSCWLat
         RXsCDpPP5zkUlsaszTuPmxcD6oVgJhRQXc3/X2YkQfWXr2tercCO8AqEjoHHD5yKMfVw
         U9eym8jory/rLGgCtN0HIaYDGmKk4j5b26Vn78521uq6ebAIJhWiMFY5aC6z+z62G1NL
         T84Q==
X-Gm-Message-State: AOAM531A2yMwaYkOOp9g2esQQuozRdb8Na0g4Qul5V35Uz0+QDTzgDg9
        iZM/uuucHpUS0cZ6wpZbODfnOavSYL0=
X-Google-Smtp-Source: ABdhPJw06JaFlwpRSVhAapjHHDqV/DxDJsS++ES8Pjts0sn6IvZXvUtVaA3OntesMvrCrqVBiHH8HA==
X-Received: by 2002:a63:f111:: with SMTP id f17mr14615515pgi.287.1610260457319;
        Sat, 09 Jan 2021 22:34:17 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id w63sm14228406pfc.20.2021.01.09.22.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Jan 2021 22:34:16 -0800 (PST)
Date:   Sat, 9 Jan 2021 22:34:14 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, ruleh <ruleh@gmx.de>,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 3/4] Input: omap4-keypad - use PM runtime to check keys
 for errata
Message-ID: <X/qf5rpxjLxSd3iq@google.com>
References: <20210106125822.31315-1-tony@atomide.com>
 <20210106125822.31315-4-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210106125822.31315-4-tony@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On Wed, Jan 06, 2021 at 02:58:21PM +0200, Tony Lindgren wrote:
> @@ -301,6 +348,7 @@ static int omap4_keypad_probe(struct platform_device *pdev)
>  	}
>  
>  	keypad_data->irq = irq;
> +	mutex_init(&keypad_data->lock);
>  
>  	error = omap4_keypad_parse_dt(&pdev->dev, keypad_data);
>  	if (error)
> @@ -320,6 +368,8 @@ static int omap4_keypad_probe(struct platform_device *pdev)
>  		goto err_release_mem;
>  	}
>  
> +	pm_runtime_use_autosuspend(&pdev->dev);
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, OMAP4_KEYPAD_AUTOIDLE_MS);

This, and corresponding changes in open() and close() seem like a
separate improvement. Do you mind splitting them into a separate patch,
and have the missing key release fix go on top of it?

Thanks.

-- 
Dmitry
