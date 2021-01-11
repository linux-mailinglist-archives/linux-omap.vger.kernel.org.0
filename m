Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4462F0CEB
	for <lists+linux-omap@lfdr.de>; Mon, 11 Jan 2021 07:28:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727454AbhAKG2g (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Jan 2021 01:28:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbhAKG2g (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 11 Jan 2021 01:28:36 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA5D9C061794;
        Sun, 10 Jan 2021 22:27:55 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id be12so8975927plb.4;
        Sun, 10 Jan 2021 22:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HaXYuv0HL9M84211PAqAW9npLxLB5P34iW/id/ASk+k=;
        b=VVApHERksLGCFmCA1fa+R08EOfoyheE8EQ40TgV+fp+F8PRtsS/WRVJC+xoYdb5aiU
         J1p0Om2yGPV8NJJJUuQdpsPZ4FKekOjq3ZX1MMVUUx3m5Gem6ODBlx6p/Jjid41JU8By
         IUuVgeb2NBiuX+m4p+h7DZi3xROCJZqTVflZjODfiZFxC8v4jeW9MP4/P3bl9KpemZhd
         S2oKZx2CMldXlGTcCn/vywYpUh5Pqcae+zvTIriG2jEFaXbjl8Tu86Wow+LdUFG5LgPH
         nhncx2TzYdWxleMW1YXOf4qXE1h1ybrwEn7++z9Xx82hUIja1Quoytc6I4+sdDvYSHXw
         QjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HaXYuv0HL9M84211PAqAW9npLxLB5P34iW/id/ASk+k=;
        b=m3WEDkioFDduJRr0p9TjbImRPMXtOOWfn0NvX2UkFK+hL7z6iD7s0izDzblhFK2oNZ
         Z6xwpjOGTctRTkPMT/1/FJNi8HGMQDN+oc/v59sv+7NlCjupjEtIRrMWaL6To2dMA7rQ
         6QuD03PgY2QU0/oNxiF9gMT67GJku+++lvH4iLLjRDGJZmuzC6bSzYMOqySQIiBY/zXW
         QZ2EalzRyK3wDT57ycCRn9f55AfK3qiBt2gZOVEXk1gVkIf5i9X2YSJDJDKfOlBuMXs8
         +MQZPy73xT1jCu4Z8UWY7H/s9/fM+5CHSPm+QmzrIiMe39GD4DXNZ0Bif7g1yzoQCyDR
         KHog==
X-Gm-Message-State: AOAM530+x10/LxaHm6m+3awa/Oe9vE13zw7tUGYLeMecDivJy6xNeULZ
        y6n8qv51Fds0FV4rOO1uAIk=
X-Google-Smtp-Source: ABdhPJwypKpSRJq6NsvfcIuqyBc/jIYRTny9YthpMLb3Wvqu4yiicQpIHLIIyeNnLT2gUqcigIuvcw==
X-Received: by 2002:a17:902:5997:b029:da:a1cd:3cc2 with SMTP id p23-20020a1709025997b02900daa1cd3cc2mr18168792pli.80.1610346475532;
        Sun, 10 Jan 2021 22:27:55 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id z7sm17885341pfq.193.2021.01.10.22.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jan 2021 22:27:54 -0800 (PST)
Date:   Sun, 10 Jan 2021 22:27:52 -0800
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
Message-ID: <X/vv6ELcy+HodFGR@google.com>
References: <20210110190529.46135-1-tony@atomide.com>
 <20210110190529.46135-5-tony@atomide.com>
 <X/vbqdQTTDg2UUaJ@google.com>
 <X/vePMbD4fwsNb5Y@atomide.com>
 <X/vqCs5/EDURprAJ@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/vqCs5/EDURprAJ@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jan 11, 2021 at 08:02:50AM +0200, Tony Lindgren wrote:
> * Tony Lindgren <tony@atomide.com> [210111 05:13]:
> > * Dmitry Torokhov <dmitry.torokhov@gmail.com> [210111 05:01]:
> > > Hi Tony,
> > > 
> > > On Sun, Jan 10, 2021 at 09:05:28PM +0200, Tony Lindgren wrote:
> > > > @@ -350,15 +379,12 @@ static int omap4_keypad_probe(struct platform_device *pdev)
> > > >  
> > > >  	error = omap4_keypad_check_revision(&pdev->dev,
> > > >  					    keypad_data);
> > > > -	if (!error) {
> > > > -		/* Ensure device does not raise interrupts */
> > > > -		omap4_keypad_stop(keypad_data);
> > > > -	}
> > > > -
> > > > -	pm_runtime_put_sync(&pdev->dev);
> > > 
> > > Why are we moving this down? The idea was to make sure the power usage
> > > counters are correct even if we exit probe early.
> > 
> > Yes you are right, omap4_keypad_close() won't help with balancing the
> > get if we exit early.
> > 
> > > Can we call pm_runtime_mark_last_busy() and pm_runtime_put_autosuspend()
> > > here?
> > 
> > Yes that should work as there's no more register access during the probe.
> 
> Below is an updated version. I updated probe to use dev instead of
> &pdev->dev since we have it there. Does this look OK to you?

Yep, looks good, applied.

-- 
Dmitry
