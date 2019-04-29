Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27E48DC46
	for <lists+linux-omap@lfdr.de>; Mon, 29 Apr 2019 08:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbfD2Gzo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Apr 2019 02:55:44 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36109 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727173AbfD2Gzn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 29 Apr 2019 02:55:43 -0400
Received: by mail-lj1-f194.google.com with SMTP id y8so1901114ljd.3
        for <linux-omap@vger.kernel.org>; Sun, 28 Apr 2019 23:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=py8hkUxqZPGmkCrXgSCQGoPR08hjy7S7SlOKlbPMprM=;
        b=ednt8Ntk8iLArELXBCnzJw6CE8KPpdojTzKWjw8IwWkoBTpj+71cUh/DhNgrJyN3mk
         E/IlN7k7CEfTeSDIeltGnqVOq0yOvi3VBNqefXNChH3k5C/+xa3z/WcfdVWeSZ44Msu5
         j2jLpNBLrnStfjKInVgM62u+D8blBTOxJ0gSG4n4dKzRPYRSefOQ76pwRpxSAiEkiGLL
         Tu40l9XPC2/bDZsVvttXTavYA1YmuuKFjLO6gOA+saLVAFgx+nU8JZXYigdSvnPrKSCI
         OlkHRiae7Dbr0uHc1Za2xUabpBAL5OvFMeG+Pevuur21mgYT2lEywYyQHEn2CoKTbH4Q
         5HFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=py8hkUxqZPGmkCrXgSCQGoPR08hjy7S7SlOKlbPMprM=;
        b=FZs5uXmUHUOu0Umm3J84cbPNzHiWl98mN5l8dQboAq7DkU/Mr08FYWu8px3uJUDC8z
         LC3ZZANp8WspW6ZYdPIuQOh4HfOUmtGtRbJ/2ScdtK9k8uxYv+Wb1UJcqyEVlakz73Ge
         gXRqGcjnBKglu7kXy01a/Eg3QS6EVWBZy0tCt1eHBSw7xJJeeTyr8wBZlvvBbQt48TCI
         FCvfxSkpyFrtvnjO11es6gN6vWPU9SJ7lhSLV9Xy0QMnt6T985+ez2dKam3lC/d33aW5
         V1hOkR02vQlJCINqzqUdzrzzMlc8wOzeA5u5lqAiytANOvmum/SSIZd1Zkm2rx8+1n+v
         o4Ag==
X-Gm-Message-State: APjAAAXqGAd/tht0wzjWDwMwexWrJElEy+IK0Cdsp0kiNwy6ygkSk1jf
        IcGY6WBv/YgMaz2OEW5GK5pjNQ==
X-Google-Smtp-Source: APXvYqxIodgdoIzWgmxKbx3hYamN1zvMGQCZoqXazdEvirAMqC3WxI7sVGMloVhxh6GwNLDNbt63WQ==
X-Received: by 2002:a2e:8ec5:: with SMTP id e5mr31913293ljl.7.1556520941913;
        Sun, 28 Apr 2019 23:55:41 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id d24sm3104733lfj.30.2019.04.28.23.55.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Apr 2019 23:55:40 -0700 (PDT)
Date:   Sun, 28 Apr 2019 23:17:14 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Tony Lindgren <tony@atomide.com>
Cc:     arm@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Simon Horman <horms+renesas@verge.net.au>,
        Thierry Reding <thierry.reding@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Russell King <linux@armlinux.org.uk>
Subject: Re: [GIT PULL] defconfig refresh for multi_v7_defconfig for v5.1
Message-ID: <20190429061714.3qcj72efkblqhjw3@localhost>
References: <pull-1555425463-418342@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pull-1555425463-418342@atomide.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Apr 16, 2019 at 09:13:37AM -0700, Tony Lindgren wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> 
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/multi-v7-defconfig-for-v5.2-signed
> 
> for you to fetch changes up to 35f8e2e29e74bb7197419d7cd80df5584e2a6311:
> 
>   ARM: multi_v7_defconfig: Update for moved options (2019-04-16 07:05:07 -0700)
> 
> ----------------------------------------------------------------
> Update multi_v7_defconfig for dropped and moved options
> 
> This series of two patches first updates multi_v7_defconfig for
> dropped options, and then updates it for moved options. We want to
> do this on regular basis to make it easier to patch multi_v7_defconfig
> without introducing errors and merge conflicts. We update the defconfig
> in two patches to make sure we're not accidentally losing any needed
> options.
> 
> After this, updating multi_v7_defconfig will become trivial, and most
> likely only a small follow-up patches are needed after the merge window
> to update it again for moved options.

Merged, thanks.



-Olof
