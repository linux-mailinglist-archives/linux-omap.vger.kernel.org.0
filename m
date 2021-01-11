Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04DBA2F0C0E
	for <lists+linux-omap@lfdr.de>; Mon, 11 Jan 2021 06:03:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbhAKFCO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Jan 2021 00:02:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726564AbhAKFCN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 11 Jan 2021 00:02:13 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1DF1C061794;
        Sun, 10 Jan 2021 21:01:33 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id t6so8890680plq.1;
        Sun, 10 Jan 2021 21:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hpf4L3YpdFkNNyZKDq8pfq/j80coUrhja102cOfT0B0=;
        b=GvG4VETtjf5Exf1aImJoQj6aKDTy8C3hlPE601xpjagmHLAkdnTrxL8/hJkW6sBrUz
         vH9w5ZTfbdFvL1AHBdJETIRrQS3PHfdqiUD52izuio9IK4VPUVHcUnVNyXl6p4rfH8gp
         79mL6WSNMKB15VxLHeG4qhAHCexml0F7V2yvvT15Wlf6FLZyVXHfRv8aocctT7utDc4E
         gyiSEN7cqDTNyTyJ4VXpLnedsgHBIzndn8CM+T5LPcNkfG+nfE+sq+IwBw8NK1TkcvXu
         1S4WGHTcg//paqg75SnxGysxMqQPhyeiEwMkUuhNZ1z+kpWJvAiByyO+DBTzuNRpqPcM
         P+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hpf4L3YpdFkNNyZKDq8pfq/j80coUrhja102cOfT0B0=;
        b=OMV9nVsmOLLG52yZGytcGnZYMqcxolYjUt96duMapIKYfQ2jjoHRd9ivapTXre2u6W
         Obxy0uFsGqkrBuBV5fdoAT6OVEp4pEqE89ZEMcVsJQdSKyI88czDtmMMEyJFm4J8o6fk
         yZUjzqE6BX0z9Ub26yVxL3wdP033DCDZKoFh9V4BIyOk5E7sDQcEhy3HJVi69DGw1zV8
         H/eAYwflEOCLZDyuA0GeZulbR2AygjxU7tIuDRQ+xjj9kmID64uxwTeDQ4spojeZfaSd
         BLPYVY0b8ejyBsvIdz6ISBVtQWEGm4KgGQj3sUB3dSM1nsCmBmYTqk/eT1GcNlfpnwOB
         qaHw==
X-Gm-Message-State: AOAM532oiAlb1WYbHbNb2rer5HXO2ljeOjK6qUcaETVu43I1c0MZ7nO2
        ePvhIaxZBDg067Db0JUtR8wvWc1L1LI=
X-Google-Smtp-Source: ABdhPJzF2oWlDggdOZ1bP0D6gX7LkgtduwxZGwhl5iOfYajKh88CB0c0lJxKmGlXOXPuzAaUtfQ71Q==
X-Received: by 2002:a17:90a:cb13:: with SMTP id z19mr16180178pjt.18.1610341293133;
        Sun, 10 Jan 2021 21:01:33 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id gp14sm17056512pjb.6.2021.01.10.21.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jan 2021 21:01:32 -0800 (PST)
Date:   Sun, 10 Jan 2021 21:01:29 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, ruleh <ruleh@gmx.de>,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 4/5] Input: omap4-keypad - use PM runtime autosuspend
Message-ID: <X/vbqdQTTDg2UUaJ@google.com>
References: <20210110190529.46135-1-tony@atomide.com>
 <20210110190529.46135-5-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210110190529.46135-5-tony@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On Sun, Jan 10, 2021 at 09:05:28PM +0200, Tony Lindgren wrote:
> @@ -350,15 +379,12 @@ static int omap4_keypad_probe(struct platform_device *pdev)
>  
>  	error = omap4_keypad_check_revision(&pdev->dev,
>  					    keypad_data);
> -	if (!error) {
> -		/* Ensure device does not raise interrupts */
> -		omap4_keypad_stop(keypad_data);
> -	}
> -
> -	pm_runtime_put_sync(&pdev->dev);

Why are we moving this down? The idea was to make sure the power usage
counters are correct even if we exit probe early.

Can we call pm_runtime_mark_last_busy() and pm_runtime_put_autosuspend()
here?

>  	if (error)
>  		return error;
>  
> +	/* Ensure device does not raise interrupts */
> +	omap4_keypad_stop(keypad_data);
> +
>  	/* input device allocation */
>  	keypad_data->input = input_dev = devm_input_allocate_device(dev);
>  	if (!input_dev)
> @@ -419,7 +445,8 @@ static int omap4_keypad_probe(struct platform_device *pdev)
>  	if (error)
>  		dev_warn(dev, "failed to set up wakeup irq: %d\n", error);
>  
> -	platform_set_drvdata(pdev, keypad_data);
> +	pm_runtime_mark_last_busy(&pdev->dev);
> +	pm_runtime_put_autosuspend(&pdev->dev);
>  
>  	return 0;
>  }
> -- 
> 2.30.0

Thanks.

-- 
Dmitry
