Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE60A8EBB0
	for <lists+linux-omap@lfdr.de>; Thu, 15 Aug 2019 14:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729986AbfHOMkN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 15 Aug 2019 08:40:13 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:43501 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbfHOMkN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 15 Aug 2019 08:40:13 -0400
Received: by mail-qt1-f195.google.com with SMTP id b11so2107347qtp.10
        for <linux-omap@vger.kernel.org>; Thu, 15 Aug 2019 05:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8N/eZnpVtVGXNfEPij+EtmJf4Wqq8E7G+Ac9dKa5ORg=;
        b=FIp1UKOL/XF7d28WrXankVVpC1aWDjJXR4RXnTts4TCW5tUa9sol9IEa9/15PqUpO5
         d2NcmIwJ3ZAamfZZyxtgrMK81y93So08k6R29YLlgEBx2wVwviIQUe2q0F5FZKlA0tWr
         y/Cb7NZ5ODCk/SLGYqGM+iZQF+ni0oDpUCm2RPYpld3cquX4HhOgK9BwgtFkJK4SJhZr
         IjiAt7CTMxO3miZD+SmE9HEg0zyDUi9hLLhrob+Sw8yz3s0WWud5fX2bkcI0Kr/ub/UW
         FDkrWIo1KIzE/fl4cXcFvDi4CylGn0L1nlCgZzAoQD4kyymsEboTAJzTJB6cT6olAY7U
         na6g==
X-Gm-Message-State: APjAAAV8KrH1kUljEVA3tnVusnp/sTggjvFelr7cab10fMobKb/6aUqT
        Sp34CK6xrFYNqcFCyTG0UL+lesgcYWV6ygu4wEY=
X-Google-Smtp-Source: APXvYqwb4zQ8FF0KzdVSpE5ZInOoO4R9nOdgsHtEhyR9Jym3zQ3ggtHiQguCw7If8eUlxix/ZQJVW96l8ka0oYGrtsE=
X-Received: by 2002:ac8:239d:: with SMTP id q29mr3688037qtq.304.1565872812114;
 Thu, 15 Aug 2019 05:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <pull-1565844391-332885@atomide.com>
In-Reply-To: <pull-1565844391-332885@atomide.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 15 Aug 2019 14:39:56 +0200
Message-ID: <CAK8P3a0Ynmu1X+Y6Ba6UP9gfyJddhFj3ZfF5vA45nZgOdfn8fQ@mail.gmail.com>
Subject: Re: [GIT PULL] fixes for omap variants for v5.3-rc cycle
To:     Tony Lindgren <tony@atomide.com>
Cc:     SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Aug 15, 2019 at 6:49 AM Tony Lindgren <tony@atomide.com> wrote:
>
> From: "Tony Lindgren" <tony@atomide.com>
>
> The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:
>
>   Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.3/fixes-rc4
>
> for you to fetch changes up to 4a65bbb9109ed7edd4b6ed7168ced48abb8561a2:
>
>   soc: ti: pm33xx: Make two symbols static (2019-08-13 05:05:38 -0700)
>
> ----------------------------------------------------------------
> Fixes for omap variants for v5.3-rc cycle
>
> We have another fix to disable voltage switching for am57xx SDIO as
> the bootrom cannot handle all the voltages after a reset that thought
> I had already sent a pull request for earlier but forgot. And we also
> update dra74x iodelay configuration for mmc3 to use the recommended
> values.
>
> Then I noticed we had introduced few new boot warnings with the various
> recent ti-sysc changes and wanted to fix those. I also noticed we still
> have too many warnings to be able to spot the real ones easily and fixed
> up few of those. Sure some of the warnings have been around for a long
> time and few of the fixes could have waited for the merge window, but
> having more usable dmesg log level output is a valuable.
>
> Other fixes are IO size correction for am335x UARTs that cause issues
> for at least FreeBSD using the same device tree file that checks that
> the child IO range is not larger than the parent has.
>
> For omap1 ams-delta keyboard we need to fix a irq ack that broke with
> all the recent gpio changes.
>
> And there are also few static checker warning fixes for recent am335x
> PM changes and ti-sysc driver and one switch fall-though update.

Pulled into fixes, thanks!

     Arnd
