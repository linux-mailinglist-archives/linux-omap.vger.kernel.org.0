Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9DCC2F0CDF
	for <lists+linux-omap@lfdr.de>; Mon, 11 Jan 2021 07:27:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727310AbhAKG0i (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Jan 2021 01:26:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726202AbhAKG0h (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 11 Jan 2021 01:26:37 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6426EC061786;
        Sun, 10 Jan 2021 22:25:57 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id n3so7774298pjm.1;
        Sun, 10 Jan 2021 22:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=c8YblQxEDlSi4KdR2OhmYHVl79InGx3H9fAohgRz1gk=;
        b=J3yz9EAS6995Cyx2OC8p55Rl2jizybjzfBpCZHrF9wRdYRF3ChKV2AdJRN8I9Ydllt
         m8beiKdHpAF7GC2dB3/0m+WHCwc5Kmr0up0YCSMx9rn5IzQivj+YH+s8KPAhg8i7rBuE
         8csU80TgBgeOwEllBXweda4RlLI+mdOUYopDIwFDu7JOUNWXmNiyw2G7V2Lx4pxCAmMw
         A53TwXU6gWd5RxLIQ8EonA/oSCmeyalLEih0BWByJsndFIYDmRDZEUfSZ0rG213ZlGQ6
         t9mhnk+myKjESwqTNgjLN2QLdnD/3cML60xVFUVSQSk1cMa5reFTJzSE9ueBkv5wDRJb
         7XeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c8YblQxEDlSi4KdR2OhmYHVl79InGx3H9fAohgRz1gk=;
        b=AKRiOnowf5wYssKfPEoIEGiFyLl9a+7Qwbtro6IY4llDejFJMhIAwSBmVW4/Hnd9AI
         IoBNLzz4moHwP3Eoo8tRYVH7j0lBHREMgDXdNzmec5LYTQ4djjKUXlXOI7+0/7xIjLFf
         E2xspt+rgBPRqOID499jSioNHr8SANdxpcuCHwt4B7QGlbzSQQVwIXpfx90AUS+M6fba
         nziKcJ62bzjEpx1jZUgIW4cDSmfxBLiDdvxFjnxt0MoZug9nx6aG9qUso+gyLKJaGt/q
         qjQZmY3jf9FmSH5H+tkXKH4CQ7wK7cqz9/+KTPDVyM8PoeDQ9axKeu0qNgW/L58khCCB
         YfGw==
X-Gm-Message-State: AOAM532EjdO5F/V03I0ryFwyjDKvs6wdvJfeBJb75k8mFEg7WO0WpQHq
        1RlwXFzT+oH++SmRDSBmIC2pK2ASK1o=
X-Google-Smtp-Source: ABdhPJwU12BYLiCuCddFEJ0LSzw3+nMPEv0uFYMphRZ1Sjim62Uf21Dgx9gN7Zq9TZ6h+Wf3UZJppQ==
X-Received: by 2002:a17:90b:34f:: with SMTP id fh15mr16145340pjb.80.1610346356904;
        Sun, 10 Jan 2021 22:25:56 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id w18sm17852785pfj.120.2021.01.10.22.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jan 2021 22:25:55 -0800 (PST)
Date:   Sun, 10 Jan 2021 22:25:53 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, ruleh <ruleh@gmx.de>,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 1/5] Input: omap4-keypad - disable unused long interrupts
Message-ID: <X/vvcTx4+kJBqLN7@google.com>
References: <20210110190529.46135-1-tony@atomide.com>
 <20210110190529.46135-2-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210110190529.46135-2-tony@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, Jan 10, 2021 at 09:05:25PM +0200, Tony Lindgren wrote:
> We are not using the long events and they produce extra interrupts.
> Let's not enable them at all.
> 
> Note that also the v3.0.8 Linux Android kernel has long interrupts
> disabled.
> 
> Cc: Arthur Demchenkov <spinal.by@gmail.com>
> Cc: Carl Philipp Klemm <philipp@uvos.xyz>
> Cc: Merlijn Wajer <merlijn@wizzup.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: ruleh <ruleh@gmx.de>
> Cc: Sebastian Reichel <sre@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Applied, thank you.

-- 
Dmitry
