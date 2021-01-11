Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D28942F0CEF
	for <lists+linux-omap@lfdr.de>; Mon, 11 Jan 2021 07:30:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727289AbhAKG3k (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Jan 2021 01:29:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727269AbhAKG3k (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 11 Jan 2021 01:29:40 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3841C061786;
        Sun, 10 Jan 2021 22:28:59 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id d2so10355687pfq.5;
        Sun, 10 Jan 2021 22:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=L9a7RW6QargSSJu8eEagqYFD+DH0EE1VGqUuzQd2Ats=;
        b=P0jP3rpSOvrxgfgg+sQOwpJf7K4PMThcDGa+qDJfkAtqMaLEUbhcv3VmZDm6cxOUw0
         PQjpRQxw3aKcVDB3bKr9f1QAhcQ+XOHQjEpmPqs3hXScrCZSY0JDGxsO3jQqlPuGwhxC
         sMuXPIdcTUMw0GIkhdwiVvjdSIYhAMZPDVJ4NbIm8gB8jaZFPoiMsB3ynSwO8Pj81QQI
         cxYJy/qcpYjQa25tEZ2JhOIbA/syOYyuIyhPM0B27bVkFCMWKFBXhnfTe1yGEwWg+Dum
         HLgCzGnUFG8b4U5FrZczwUdmH5XOa4LhBlfrSVg8QC/Y18Q+AIhvDKPoD/fNXVFARt53
         IIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L9a7RW6QargSSJu8eEagqYFD+DH0EE1VGqUuzQd2Ats=;
        b=A1QhpLes5Ue2oqSUajdDUgoNIxZXbzNPK6mOmPTE4O3OIDzyXL7IWkxBlsv7SopE7V
         jAmtgp75k/Lq7D2i/QMXRcCG87tjLXZe0bqOsvAFTg8kd+NpxVv2A1pI+azsjk9O5LqW
         i4y6QNXsVm3uDmU/w7JgehUKobXMIEp80xuXDynx9vebfmCkqgVyl4pHUWOuKUurxIWG
         6TrSxqoqGFIWZqdBNHqPbQ5dTX0AyePmUG/B2HLMJZYw3xzxlZ6gtba9aIz+ru9mLvul
         5tIxs3ame+iMH6M3jBpmjMf5vIk1ZW0VUuiXcaTG5smCeBP2b8h4Kl6Bm5xK682IT+1/
         ZYZw==
X-Gm-Message-State: AOAM5334KMQxJ2x8rmf+Zrt8GGbbb1BmmdVMuOmkn/pBPaCf3STtYDv0
        tCSHZz79fa2XdvhYoDN3n0s=
X-Google-Smtp-Source: ABdhPJzmVhF3KND1/LpzItqkTQPUgNlqUz49WtmSrvfjdP0pcfT/ra/BFXKckfw6aJdHGZjd/gUr0A==
X-Received: by 2002:a62:8482:0:b029:1ae:6d04:bddb with SMTP id k124-20020a6284820000b02901ae6d04bddbmr15223336pfd.11.1610346539406;
        Sun, 10 Jan 2021 22:28:59 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id p16sm17442629pju.47.2021.01.10.22.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jan 2021 22:28:58 -0800 (PST)
Date:   Sun, 10 Jan 2021 22:28:56 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, ruleh <ruleh@gmx.de>,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 5/5] Input: omap4-keypad - implement errata check for
 lost key-up events
Message-ID: <X/vwKOTseVL7tkhq@google.com>
References: <20210110190529.46135-1-tony@atomide.com>
 <20210110190529.46135-6-tony@atomide.com>
 <X/vrygoBxzGyXhfc@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/vrygoBxzGyXhfc@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jan 11, 2021 at 08:10:18AM +0200, Tony Lindgren wrote:
> * Tony Lindgren <tony@atomide.com> [210110 19:08]:
> > --- a/drivers/input/keyboard/omap4-keypad.c
> > +++ b/drivers/input/keyboard/omap4-keypad.c
> > +/*
> > + * Errata ID i689 "1.32 Keyboard Key Up Event Can Be Missed".
> > + * Interrupt may not happen for key-up events. We must clear stuck
> > + * key-up events after the keyboard hardware has auto-idled.
> > + */
> > +static int __maybe_unused omap4_keypad_runtime_suspend(struct device *dev)
> > +{
> > +	struct platform_device *pdev = to_platform_device(dev);
> > +	struct omap4_keypad *keypad_data = platform_get_drvdata(pdev);
> > +	u32 active;
> > +
> > +	active = kbd_readl(keypad_data, OMAP4_KBD_STATEMACHINE);
> > +	if (active) {
> > +		pm_runtime_mark_last_busy(dev);
> > +		return -EBUSY;
> > +	}
> > +
> > +	omap4_keypad_scan_keys(keypad_data, true);
> > +
> > +	return 0;
> > +}
> 
> So with the improvments done, here we need to replace the true above with 0
> so when the hardware is idle we clear any stuck keys. Updated patch below.

Applied, thank you.

-- 
Dmitry
