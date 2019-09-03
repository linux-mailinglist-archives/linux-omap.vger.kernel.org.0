Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98E9FA688D
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2019 14:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbfICMZq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Sep 2019 08:25:46 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:45140 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbfICMZq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 3 Sep 2019 08:25:46 -0400
Received: by mail-qk1-f195.google.com with SMTP id z67so2773021qkb.12
        for <linux-omap@vger.kernel.org>; Tue, 03 Sep 2019 05:25:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6KBFF4Iy8Th4Ylok9u/qejGGHxj1LgnDO8O5WoYbCUo=;
        b=rVu/7hcyeB/cmruyafzEw8FcLd1cKALnZeDwKWBNTDz192EPfwFZOFTM4CoYRzt09m
         csc3JANZku2sN1ezT1jDahr9jgIZQnsJb4boVYFpt3ab3t0Mev8dXAuxBt+ipYbxxV27
         QiQCgwMnqcWz8dEYX2TuNJ2wUUUJ2ldKzw9sG+wyM0gLQ9ILk/L7455y36oJIF1ogEIK
         LzT53laHlXnPYMJjckkpgYc3IHragp2K+Mo3NHeGDJD9ENmsQZ3LCRTY7wzMa20MU+dM
         ZOTMEdThEH9EYXvkEvZrx0S9Z5TmEXCj5fdJQd1a8Anl6kH8QuffZe+P1qIgQr17aUU7
         Y9dg==
X-Gm-Message-State: APjAAAWxNV/Q0PG/sfmw6OnH7L8/v2n0vLmboq6hLqAHotRwR1zo0UuB
        oNMrmrg7sYACL2QZb3jodEnXtfhWG/acUaW+CxGWsQ==
X-Google-Smtp-Source: APXvYqzd+j8rv3cxa9/OJtU5gqFEsQw7tXrrvUWDVdam82IgLLb4nIRI5uS8BLLJxxm5VAQsB5KmzqPxhxAeTWdcSLA=
X-Received: by 2002:a37:4051:: with SMTP id n78mr32187790qka.138.1567513545488;
 Tue, 03 Sep 2019 05:25:45 -0700 (PDT)
MIME-Version: 1.0
References: <pull-1567016893-318461@atomide.com>
In-Reply-To: <pull-1567016893-318461@atomide.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 3 Sep 2019 14:25:29 +0200
Message-ID: <CAK8P3a2ox-G7238GZmJjxEb1Q-yc9RvQ541xwSKpdqaF+Y_NmQ@mail.gmail.com>
Subject: Re: [GIT PULL 1/4] soc changes for omap variants for v5.4
To:     Tony Lindgren <tony@atomide.com>
Cc:     SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Aug 28, 2019 at 8:35 PM Tony Lindgren <tony@atomide.com> wrote:
>
> From: "Tony Lindgren" <tony@atomide.com>
>
> The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:
>
>   Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.4/soc-signed
>
> for you to fetch changes up to 50f57ef83d836d727902a6a7e70cca61b0d02655:
>
>   ARM: OMAP2+: Delete an unnecessary kfree() call in omap_hsmmc_pdata_init() (2019-08-26 08:59:48 -0700)
>
> ----------------------------------------------------------------
> SoC changes for omap variants for v5.4
>
> The first change moves platform-specific asm-offsets.h to arch/arm/mach-omap2
> to fix iessu with parallel build with CONFIG_IKHEADERS, and the second change
> removes a useless kfree.
>
> Note that the first change causes a trivial merge conflict with the iommu
> changes for arch/arm/mach-omap2/Makefile.

Pulled into arm/soc, thanks!

      Arnd
