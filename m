Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0309DC41
	for <lists+linux-omap@lfdr.de>; Mon, 29 Apr 2019 08:55:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbfD2GzU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Apr 2019 02:55:20 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37218 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727173AbfD2GzU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 29 Apr 2019 02:55:20 -0400
Received: by mail-lf1-f68.google.com with SMTP id h126so7089600lfh.4
        for <linux-omap@vger.kernel.org>; Sun, 28 Apr 2019 23:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uQ0M3kqEovToVRAy71tzWRCOIWwo8jCLOl+DSwKEQi8=;
        b=yLBEyFP/1Uryno0mlE5nUrm+bSXArFHFkanRz3N1F+RPNGH/60A3Z5vFFpMn+7s6Sm
         Mo59pMG+XxrUCqmSURPpB12Yi6ruRXo9swU5PNWjmogP5K344jz0peHQ4Kg4gn808LY0
         43RPrvdOPyx5Urr/wzdUl0TBQPDHNEWFRF5JGcO6zOArJvlNbBxWtqfuvdryv9CubTBq
         wwLJSBp+6HJxM088GygJG34PUGHpI05VcckDhh6P+iWCEXIxRuaksNYDLdHD4206WjQv
         01e2KfBkVUPre3shRlSRvo220xGIoH+TPoTLCyhw4LMxLhr8SCPmchtR5qK8MpcElvYD
         bzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uQ0M3kqEovToVRAy71tzWRCOIWwo8jCLOl+DSwKEQi8=;
        b=CZy4I6OMFaaqvk6naNvh9qy0i4eyr+R74xJR6KupfmKtKL/wTMUEd4Z866B7z6lITD
         Vg4nf2fKvPKGnpP+lvSUO+Ifr9rpR1K7Ni/aAIBV0GhUYy29fb7xjHGDMcxFpFhKW2FZ
         VSU8bIDTsmyfBIMSJ1oa4Ink3Kga9jKa0Cw4kLzAh+kj5gaW6UqNQkauWNsGzr6Qs2RM
         5rtI2gB/cr++ieQ3jh4GZnk3SA5FUbRFRg3bIMCHeNQitEtlbrw3zEMAGFKWTBOmioin
         z5E+XLtWeTYHdNanYXiLyTF4somOmwfgrtQK3IPksAW9Pg4i8Ogi0pgwyETvjFFIi8uj
         VCEg==
X-Gm-Message-State: APjAAAVJQhlgycvyu5kYCemwDMrF86sZATofBehR+dlyUZP+odFMwsNh
        Dzj7JBev2j4gUaj5Y81Wqd+MMVHMOCk4vA==
X-Google-Smtp-Source: APXvYqyIpXA1W9U9khiBW5Aeg5sKxj1A2pY8tQwgbbEQgXEUJ7XjutNJ0hTJ4UuaTkzvH7PpZqUmWQ==
X-Received: by 2002:ac2:4148:: with SMTP id c8mr27915519lfi.2.1556520917941;
        Sun, 28 Apr 2019 23:55:17 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id y20sm7255527lfe.8.2019.04.28.23.55.16
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Apr 2019 23:55:16 -0700 (PDT)
Date:   Sun, 28 Apr 2019 23:03:53 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Tony Lindgren <tony@atomide.com>
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 2/3] ti-sysc driver changes for omaps for v5.2
Message-ID: <20190429060353.45vk2anagak44z3o@localhost>
References: <pull-1555087688-487222@atomide.com>
 <pull-1555087688-487222@atomide.com-2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pull-1555087688-487222@atomide.com-2>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Apr 12, 2019 at 10:02:06AM -0700, Tony Lindgren wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 8b30919a4e3c7aba32dd72e8208147a6496cb16c:
> 
>   ARM: OMAP2+: Handle reset quirks for dynamically allocated modules (2019-03-26 11:26:26 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.2/ti-sysc-signed
> 
> for you to fetch changes up to d59b60564cbfe77d85c2f51b29941d8ed14984d1:
> 
>   bus: ti-sysc: Add generic enable/disable functions (2019-04-09 08:58:48 -0700)
> 
> ----------------------------------------------------------------
> Driver changes for ti-sysc for v5.2 merge window
> 
> This series of changes for ti-sysc interconnect target module driver
> gets us to the point where we can actually drop legacy platform data
> for many devices in favor of device tree data.
> 
> To do this, we improve ti-sysc driver not to rely on platform data
> callbacks to manage module clocks, and handle more quirks needed for
> some devices. Also few minor fixes are needed, but were considered
> not needed to be sent separately as they only show up with this series.
> 
> Then we drop several thousands of lines of legacy platform data for
> omap4, omap5, dra7, am335x and am437x. We drop platform data for mmc,
> i2c, gpio and uart devices to start with as those are typically
> easily tested on all devices. In case of unexpected issues, we can just
> add back the legacy platform data for a single device type if needed.
> 
> Finally we add initial support for enabling and disabling some devices
> without legacy platform data callbacks. I was planning on sending the
> dropping of legacy platform data as a separate series, but already
> applied Roger's patch on top and pushed it out.
> 
> Note that this series depends on related SoC and is based on those.

Nice cleanup!

Merged, thanks!


-Olof
