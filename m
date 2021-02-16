Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98E2A31C7D7
	for <lists+linux-omap@lfdr.de>; Tue, 16 Feb 2021 10:13:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbhBPJKe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 16 Feb 2021 04:10:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229869AbhBPJKU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 16 Feb 2021 04:10:20 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E33C5C0613D6
        for <linux-omap@vger.kernel.org>; Tue, 16 Feb 2021 01:09:39 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id l12so12080546wry.2
        for <linux-omap@vger.kernel.org>; Tue, 16 Feb 2021 01:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=K5zC5Y1zvesaXwk7zKrXE6Sqg4y3GDAfdw86rtI8m6o=;
        b=apOi8qqe7jYCfTsdg9jYa8ZrUBRJbUmEArshiR1i9FfkUoecNLS9KkVJcm/QJRL5DL
         /9T3XDBGoBqCDzbr8zdH/7xPgZh8a/WcCs6TA+IjXaisFenEZ2KaMvQBJ5CSClTzVoot
         0g6vceEQPdrP5n158Jz2msejzcc589GAAqUtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=K5zC5Y1zvesaXwk7zKrXE6Sqg4y3GDAfdw86rtI8m6o=;
        b=pKIO/ujldfsznvXiTwLDSXUb/RO5nozYPc/Y/1CGXIEmtNtjIh3S7YviCkXazr2T9c
         tR16oi3IcW++LcrEsJXbyU+aiIookfkXU/UcXRo1hbK+ahr/KTRll0SqcIy8DjkFbtyW
         3VHVpOB1smBriKzaeGBCJZ/kO/bTL3OVqn1SWWvdy8qIHZ/36POvBZD4L8/AlgLaxiEf
         mAjgagJ/hjdRKmc6UKTQQz4LQu44Pyjhs2Dp95WYc/HG/3FiIpNaK8d8y7kuAK+ZPFQo
         z9BI14DkDbng6mrCGCq5zDRw9ajTmhKELd8CEGWRAJI/ruOdKdGTtHjP3AScdwgnHZNS
         I45g==
X-Gm-Message-State: AOAM532DMghExMT4+42g6RWLgXp2Tpe7IYTBxQmrsBKKSQUWkVF+shDM
        L64e3GUToV8JsKlfzMHPNR3ZFFEBFWv0F+N+
X-Google-Smtp-Source: ABdhPJzdZcOoTuCKynHice6z5PD8IYy6n4mOt3kwBaTsySFHj1AcBgs/+6shoAJ1fW4RiLQTiIgn/Q==
X-Received: by 2002:a5d:6602:: with SMTP id n2mr22288886wru.150.1613466578573;
        Tue, 16 Feb 2021 01:09:38 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z1sm221367wmi.22.2021.02.16.01.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 01:09:38 -0800 (PST)
Date:   Tue, 16 Feb 2021 10:09:36 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        dri-devel@lists.freedesktop.org,
        Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH 0/3] video: Remove in_interrupt() usage.
Message-ID: <YCuL0DR8CQXEKTjP@phenom.ffwll.local>
References: <20210208223810.388502-1-bigeasy@linutronix.de>
 <20210216083500.brcafu6mo2yiz3cg@linutronix.de>
 <YCuFli/TEl6gysTb@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YCuFli/TEl6gysTb@kroah.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Feb 16, 2021 at 09:43:02AM +0100, Greg Kroah-Hartman wrote:
> On Tue, Feb 16, 2021 at 09:35:00AM +0100, Sebastian Andrzej Siewior wrote:
> > On 2021-02-08 23:38:07 [+0100], To linux-fbdev@vger.kernel.org wrote:
> > > Folks,
> > > 
> > > in the discussion about preempt count consistency across kernel
> > > configurations:
> > > 
> > >  https://lore.kernel.org/r/20200914204209.256266093@linutronix.de/
> > > 
> > > it was concluded that the usage of in_interrupt() and related context
> > > checks should be removed from non-core code.
> > > 
> > > In the long run, usage of 'preemptible, in_*irq etc.' should be banned from
> > > driver code completely.
> > > 
> > > This series targets the video subsystem. The omap patches are a repost
> > > of [0], the amba-clcd is new after I received no feedback on my analysis
> > > [1].
> > > 
> > > [0] https://lkml.kernel.org/r/20210127172902.145335-1-bigeasy@linutronix.de
> > > [1] https://lkml.kernel.org/r/20210127174408.ududpwfrbg3dhyxj@linutronix.de
> > 
> > Could someone please apply the series? Video seems unmaintained.
> 
> It's the merge window, no one can apply the series...
> 
> Please resend once 5.12-rc1 is out.

drm trees are always open, to avoid the merge window blackout lol :-)

Reason I didn't merge anything is that I'm intentionally letting fbdev
hang in there, in the hopes someone picks up review&patch apply duties. It
already worked a few times but then people move on again ...

Anyway patches queued up in drm-misc-next for 5.13.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
