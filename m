Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41059476BB
	for <lists+linux-omap@lfdr.de>; Sun, 16 Jun 2019 22:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726038AbfFPU2U (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 16 Jun 2019 16:28:20 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:41877 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbfFPU2U (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 16 Jun 2019 16:28:20 -0400
Received: by mail-io1-f68.google.com with SMTP id w25so16803754ioc.8
        for <linux-omap@vger.kernel.org>; Sun, 16 Jun 2019 13:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TKcNxxKKhhi5YCQ/Pl419pRxPJBD99sELxjgL+BfnfA=;
        b=myjxzjgoXUIupkBaaweKT1ABsInTa/eP6Ad/lNrbPvrZpC7kie0X/X+z7i5zcn6zaA
         vFQoMPql435QTdJ6T1+i0+yuuC7dT8cSPUSjQao/Cw6GVhd1PfZp6Qq80JJFAhGj4kKz
         MI7BbZ62UxthoRRcqNTRK5jH7sXN1IEBEFoKUKxkaZhQqpZh0O0qSVfsQM+vC7n4g6rJ
         GWSHw+D2SkD41L9UrOYsXuPdy47fwgNQNJ/SSyu3l/NQ4PyFqMWCxUzSY0jA2VH5rXwQ
         JcsQVUxPb1SiwMoP1jjntbXwV0YVqdYlqMPvtsZltM4vEbdO+wMwchom4U46IxRwiWBc
         Gc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TKcNxxKKhhi5YCQ/Pl419pRxPJBD99sELxjgL+BfnfA=;
        b=uNYbNkxsbQ0l6n4+fFTxK66+rXZj8TQ8ElOvLiijw3jrq8HVPyzpjXkYbFKUGjEfVN
         qsTbRKSEAX1KTBGj7oyhdSbnIOCKhRpaPFaPldMDTASGmfCFpZxI/p5OVwMUGTFYQEhH
         XPKLJlrOEQpiVLHbAAz56YuyTB1Uy9Y7J24lBk+0iGrHmNC5MIjyh9jNwXuu+fZg8dHE
         IABXDgRO64PvfYEq++gO8oz1kdFnE9Ec2wgY2FZQEPNbibiNXj4dhbJ3kNrLnb5v8aon
         gA6ifCKQ05vt0vgFnuNA1WEowBfR61f3dN0SPx84vi2RWWD2hvMM17wJV5q/u/WJ3toT
         bAsw==
X-Gm-Message-State: APjAAAUX8T2wafC9NlwFV0TxWhOQsSdbbNEk1eHS237BLf13cukh5uBu
        7zFZ8vg0AbRh3Uj00FSDjvby9IBvk75zKJCNK+FFug==
X-Google-Smtp-Source: APXvYqx4oKrbeKXzonXiv2aCFoGoAg6IWFHZF3WAkuBSLFqKC1HWrT1XTikb7ENMsriES2AutC/UUlFrA+4IIPsOMRI=
X-Received: by 2002:a5d:8347:: with SMTP id q7mr12879556ior.277.1560716899194;
 Sun, 16 Jun 2019 13:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <pull-1559115102-965591@atomide.com>
In-Reply-To: <pull-1559115102-965591@atomide.com>
From:   Olof Johansson <olof@lixom.net>
Date:   Sun, 16 Jun 2019 13:28:08 -0700
Message-ID: <CAOesGMhF9_3Y184zAC3bdyRMemnM4CLBiOp-vcRaXQOrtf0E1A@mail.gmail.com>
Subject: Re: [GIT PULL] mmc voltage and boot issue fixes for omaps for v5.2
To:     Tony Lindgren <tony@atomide.com>
Cc:     ARM-SoC Maintainers <arm@kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, May 29, 2019 at 12:32 AM Tony Lindgren <tony@atomide.com> wrote:
>
> From: "Tony Lindgren" <tony@atomide.com>
>
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
>
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.2/fixes-rc2
>
> for you to fetch changes up to 4ee23cd76c0ce8622976b3da0e2bc89e6d94f6d4:
>
>   Merge branch 'omap-for-v5.2/ti-sysc' into fixes (2019-05-20 08:33:03 -0700)
>
> ----------------------------------------------------------------
> Fixes for omap variants for dra7 mmc voltage and boot issues
>
> This series contains dra7 mmc voltage fixes, and fixes to the recent
> changes to probe devices with device tree data insteas of legacy
> platform data:
>
> - Two fixes for dra7 mmc that needs 1.8V mode disabled as in case of a
>   reset, the bootrom will try to access the mmc card at 3.3V potentially
>   damaging the card
>
> - Two regression fixes for am335x d_can. We must allow devices with no
>   control registers for ti-sysc interconnect target module driver for
>   at least d_can, and we remove the incorrect control registers for
>   d_can. And we must configure the osc clock for d_can as otherwise
>   register access may fail depending on the bootloader version
>
> - Four regression fixes for dra7 variant dts files to tag rtc and usb4
>   as disabled for dra71x and dra76x. These SoC variants do not have
>   these devices, and got accidentally enabled when the L4 interconnect
>   got defined in the dra7-l4.dtsi for the dra7 SoC family


Merged, thanks!


-Olof
