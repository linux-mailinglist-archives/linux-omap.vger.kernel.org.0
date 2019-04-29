Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3E90DC42
	for <lists+linux-omap@lfdr.de>; Mon, 29 Apr 2019 08:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727264AbfD2GzW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Apr 2019 02:55:22 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45827 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727173AbfD2GzW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 29 Apr 2019 02:55:22 -0400
Received: by mail-lj1-f193.google.com with SMTP id m18so3679001lje.12
        for <linux-omap@vger.kernel.org>; Sun, 28 Apr 2019 23:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=s6Nfe/yOHFaoFampqTJM/h2XjRKZIGQHP41ZaPdkDEM=;
        b=Si77qPj523VOAA6KqVwSD+7CSGgmvOQYh/IzoglQl4ZyH3xC3z7UTac4nUhrLk0ZTp
         Sq0MKx4JR2o2DCjfCRTWSEigWtRpFTdeUm8GUPwLIy9cyFxllCF6V4chBWQwpl11pMZh
         BjUF7URQ3Oj/Us9ZH8GeKCF9at7oYGRum6JqBsd7BX3OlyoCk6IVKixow97Ofgvdhu7T
         qVlXiPCrAF+THnWZnbyb4mYvFMpP29cMEjRSH7GSL5pGNpM+CllNTY3PglnVtBfoRmmO
         oys4BOOjoonEqBMDgBjncZ92T4SPlNB4fWsBY3C5VRABjnDQtnIVvdJU9q0gTP+9X9kw
         5xQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=s6Nfe/yOHFaoFampqTJM/h2XjRKZIGQHP41ZaPdkDEM=;
        b=kJ8DcNOVLbbGGHxDLtQ25zY1aI/sldSk2RMEV9SBFum/9g7iAy/Ec/s9i2p7IK3HLO
         I3hIng63IhVnvcOchQ+OqFkzgQ0P/kGvFLywgqd/0AoCB0SJjDpmuIges7mEBTU3ggSi
         hY+dVbFub/4cGiw47ioxA8yvQxzpRb+lgDZdyxSp65G6zqyrmYQwv8YaX7lkIS3koy7/
         0GToioUYfpOU7XAGAktgLD6Y32L/nK9tesk7/ec51OzD3e6nWHkXb5NxLZx+qccVcffK
         BSdkj8wLqzzPgTn2cr0kX5dwS/NNXISGIkDTxdIf5jwAIXQH5mShWEYYXYTRLVNKsUs5
         w0OQ==
X-Gm-Message-State: APjAAAVL2BIcGEwcRLGNmA8kV9QlghglkNpPEs0NwGeaSuQi1WpGGUH5
        bLNeLzHByuwNI6tWBrUqdiKXEQ==
X-Google-Smtp-Source: APXvYqwcLhT+1cJq3zLp75oi8RzS2o4/CDsvnqKZ3BjkyF62W/3z/Wc8SqSa6PfI8UdODQUhj+fJEw==
X-Received: by 2002:a2e:22c4:: with SMTP id i187mr31178593lji.94.1556520919923;
        Sun, 28 Apr 2019 23:55:19 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id 12sm212559ljj.79.2019.04.28.23.55.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Apr 2019 23:55:18 -0700 (PDT)
Date:   Sun, 28 Apr 2019 23:04:24 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Tony Lindgren <tony@atomide.com>
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 3/3] pm changes for am335x and am437x for v5.2
Message-ID: <20190429060424.vw2giqpcnkcwkqm2@localhost>
References: <pull-1555087688-487222@atomide.com>
 <pull-1555087688-487222@atomide.com-3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pull-1555087688-487222@atomide.com-3>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Apr 12, 2019 at 10:02:07AM -0700, Tony Lindgren wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> 
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.2/am4-pm-v2-signed
> 
> for you to fetch changes up to 35667d812c38a219ea2dc6f23d33db50de57099e:
> 
>   Merge branch 'omap-for-v5.2/am4-ddr3' into omap-for-v5.2/am4-pm-v2 (2019-04-10 09:06:01 -0700)
> 
> ----------------------------------------------------------------
> PM changes for am335x and am437x
> 
> This series adds support for am437x RTC-only mode in suspend. In the
> RTC-only mode suspend, everything is shut down except the RTC. This
> makes the power consumption very low for suspend mode.
> 
> To support RTC-only mode, we need to export omap_rtc_power_off_program()
> from the rtc driver and improve PM code to save and restore the wkup
> domain context. As RTC-only mode depends on the device being wired
> properly for things like memory, we need to also check for the machine
> type before we allow it. We also need to run DDR3 hardware leveling on
> resume.
> 
> Note that there is a trivial merge conflict between the RTC branch
> and these changes where the RTC branch makes tm2bcd() a void function
> and the error handling parts can be just dropped.

Merged, thanks!


-Olof
