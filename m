Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10FAEAD992
	for <lists+linux-omap@lfdr.de>; Mon,  9 Sep 2019 15:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729213AbfIINEF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Sep 2019 09:04:05 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34630 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727045AbfIINEE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Sep 2019 09:04:04 -0400
Received: by mail-wr1-f67.google.com with SMTP id a11so3977382wrx.1
        for <linux-omap@vger.kernel.org>; Mon, 09 Sep 2019 06:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9y+22Q8ixtWcD5ju9SRyneHTrf2Ur/gcyX9aL38jrJ8=;
        b=m4C6Xk/j6j5iR6qiDeoF0BoZ6vmChDvg4ZUHZGDPPwDvfBnH1hKZmBSsAOTdCvvTO5
         YGmDb1lmCn/E7iSQ2S005YmgvIXL6rJbsyQgRfPg4H0/AGqpD8RkFK70n78chiLKok4j
         9iL8/W1WCvuhRISx3B5OGOWhEZXUlf2csBCJcGau5vnsnHn3+C3vB4/PyfCivyH0JOq2
         L3ncuaHISdM5M2NBHFdwN3QXXUrSX7QaRTFGQALc+GA2gmQ1WkwdYd3r6se4/AmZyqke
         T6QE2eE7qidPUOKEHCh9mXFY4tzbH0HFJ6InTMQBgxvX0pKHNTKXtPkX+H1dXJK21H9K
         n6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9y+22Q8ixtWcD5ju9SRyneHTrf2Ur/gcyX9aL38jrJ8=;
        b=YlK1fRtncoFVdaOtxePfHaRDCRS1dVkFB53eP7Htp7Wo7uxmF6qt6+SH0hPBEJiKiq
         XrOVtFR1eQePdAs8Pg2MS0hezXJ292VqM9TnQaey+/NBUayQ1r1+vO543A3+YASzP++g
         cJ2GYf7gnCCSkPWMRpUOWf1htfufLW25ZdnrudR+u392MpMx6A7lw4tuPEb8ExnOKNCO
         uw+iQHnT58JL2+Exn6TBpx6zoya4vxjzcV/w2b+c1RmOefO/8l2eJxK/VyQyAUjr6x7p
         jRjAGfpDhEOdBl7IrBS5GVCtMWeKZI2W02n7wn9CYsghWBqP7VVr5dILLOgc03mise8w
         9bEw==
X-Gm-Message-State: APjAAAVIcQ/Nf2Qox9fo+ShkWUJQ6L0YwE5Iht/vwTF/gIgzHdg0v1sM
        CPXFIQ7xFJ6OsEq2bcUCyY+UEQ==
X-Google-Smtp-Source: APXvYqwk/hc+u/zqnHFB7vI8hYnVgaNIR9Xf1U5ML8a8gIMOmTBbmhFEHswaAoqNvRMqTbL5YHIWKw==
X-Received: by 2002:adf:f88e:: with SMTP id u14mr18227770wrp.260.1568034242622;
        Mon, 09 Sep 2019 06:04:02 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id f3sm15033405wmh.9.2019.09.09.06.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2019 06:04:01 -0700 (PDT)
Date:   Mon, 9 Sep 2019 14:04:00 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, tony@atomide.com, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org,
        tomi.valkeinen@ti.com
Subject: Re: Status of led-backlight driver
Message-ID: <20190909130400.erccomveu2ongeks@holly.lan>
References: <20190907100726.GA12763@amd>
 <20190909111410.dwqvg6b4lgxymn2o@holly.lan>
 <e40fcd10-85ef-9e04-0960-210736075f1f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e40fcd10-85ef-9e04-0960-210736075f1f@ti.com>
User-Agent: NeoMutt/20180716
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Sep 09, 2019 at 01:46:39PM +0200, Jean-Jacques Hiblot wrote:
> Hi Daniel,
> 
> On 09/09/2019 13:14, Daniel Thompson wrote:
> > On Sat, Sep 07, 2019 at 12:07:27PM +0200, Pavel Machek wrote:
> > > Hi!
> > > 
> > > I don't see the LED-backlight driver in -next. Could it be pushed? It
> > > is one of last pieces to get working backlight on Motorola Droid 4...
> > Sorry, I dropped the ball on this and was therefore rather late
> > reviewing this patchset.
> > 
> > Assuming I have read the code correctly I think there are some
> > problems with the max_brightness handling in the backlight code.
> 
> Can you comment this? I'll be happy to fix the problem.

I did that before replying to the nudges. See:
https://lore.kernel.org/linux-leds/20190909095304.67ehnpg6gckwpno4@holly.lan/


> Reading the v4 again, I noticed that that I still had not removed the
> brightness scaling. Is that the problem ?

Yes (plus a couple of nits).


Daniel.
