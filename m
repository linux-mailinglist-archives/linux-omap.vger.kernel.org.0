Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7215AE3D70
	for <lists+linux-omap@lfdr.de>; Thu, 24 Oct 2019 22:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728240AbfJXUjn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 24 Oct 2019 16:39:43 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:46133 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728295AbfJXUjm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 24 Oct 2019 16:39:42 -0400
Received: by mail-il1-f195.google.com with SMTP id m16so17276662iln.13
        for <linux-omap@vger.kernel.org>; Thu, 24 Oct 2019 13:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tgj5mFJJlxLCDIbRYcFCYlWFe6stYdijRRC9FGrHxdI=;
        b=F64VJxOipVr4Sm8yUf8Y1xuWaCfzK2k3LAvmIUo6KldRq0gFl6SpgDnjEKHmt2kLwW
         80vfNGVwnnkP2yYmKLNZW84pCVF4pqgSSRJ6Guychac0+GVzhkW/lbrDop5vmrZyl02K
         0AgRVVl2mynYNo21geu4OKi72MRI1sMcByShUcMxbEpez/ao6pCds8jXBo/aKMuRJMt9
         PniidlkD8Qzdrs5mI16HqZ6wzOdgSVON9kqGnUE5lngYx/jetSlHP+EFAFyMDY4ZBhSC
         0Ckn6BpYTm/jYTooWYd5XOL9WvU/PnhxMv2/mcL9YHuSBOSP/ymDjaXSpfnPgk9ohGup
         HpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tgj5mFJJlxLCDIbRYcFCYlWFe6stYdijRRC9FGrHxdI=;
        b=selaDeZVXTT+gHsbGU+kFumEl0ZvjobQayD4lEw0AYdHJ6MjcFCuY0704t7BnTdVeJ
         uTV391pG0wBJUqAqVPO/xbyr9XQytLO9wGAqjgxZSgL11vyKvymvwnNKvNVETF9R5A2P
         EItoMBCjUEYyGUrHpdBWSBmbv01QnuAvhk/Kv2Jptl8Larxq6/5riR8qpu47AJ0q7KyF
         QvIB1u0n7VEdvh+E4RHdl7pRF7w0euKSx5RbpubGBxFUeWenbW07EbJNpv1ntoD4AXEn
         wWLxhTzwplRAQoQRrRyI2+H2ropdkVJKKm3FI3sQ9s3Ll+LNFZ4P8Cd97VBOF0c5QC5X
         RSCQ==
X-Gm-Message-State: APjAAAUivtepPqj4CtVqKnjRcoUI6BxFIRxjuwivhr0mLcr+NOYwQ5HT
        WVuJtXw/7ulinzz9V5j8TGIg/1Yp+yvlUjfsHHkH1A==
X-Google-Smtp-Source: APXvYqxULDhuG5ACyKYB8t65s2MsMwU3BlNEE7BnitEhFpl+W+aVcdmSmMTwUNedyeY0xJdOhrTu4YM2oI0R0PJqI1c=
X-Received: by 2002:a92:1b4c:: with SMTP id b73mr28803378ilb.207.1571949580089;
 Thu, 24 Oct 2019 13:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <pull-1571934890-285615@atomide.com> <pull-1571934890-285615@atomide.com-3>
In-Reply-To: <pull-1571934890-285615@atomide.com-3>
From:   Olof Johansson <olof@lixom.net>
Date:   Thu, 24 Oct 2019 13:39:28 -0700
Message-ID: <CAOesGMgjG-DGjSJT4AB9D7ZQFsYorNmMyzLCHoD=UzjBLF7MvA@mail.gmail.com>
Subject: Re: [GIT PULL 3/3] drop legacy platform data for omaps for v5.5
To:     Tony Lindgren <tony@atomide.com>
Cc:     SoC Team <soc@kernel.org>, ARM-SoC Maintainers <arm@kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Oct 24, 2019 at 9:37 AM Tony Lindgren <tony@atomide.com> wrote:
>
> From: "Tony Lindgren" <tony@atomide.com>
>
> The following changes since commit 1819ef2e2d12d5b1a6ee54ac1c2afe35cffc677c:
>
>   bus: ti-sysc: Use swsup quirks also for am335x musb (2019-10-21 14:15:55 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.5/ti-sysc-drop-pdata-v2-signed-take2
>
> for you to fetch changes up to b08a0c577518a02ea08673f68881223a3ed35cc6:
>
>   ARM: OMAP2+: Drop legacy platform data for am335x musb (2019-10-23 07:46:32 -0700)
>
> ----------------------------------------------------------------
> Drop legacy platform data for omaps for v5.5
>
> This series of changes continues dropping legacy platform data for
> omaps. With the proper device tree configuration in place in the dts
> files for ti-sysc interconnect target module driver, we can drop the
> related platform data and legacy ti,hwmods custom property.
>
> Most of the patches in this series drop platform data and custom dts
> property one device class and one SoC at time. This way we can easily
> revert one patch at a time in case of unexpected issues if the fix is
> not trivial.
>
> For am335x musb, we need to first update the device tree to probe with
> ti-sysc interconnect target module driver. And then the following
> patches drop the legacy platform data.
>
> Note that this series depends on earlier ti-sysc related driver changes

Couldn't quite tell where to land this, but I picked arm/dt mostly to
avoid possible toplevel conflicts with other branches that touch
device trees.


Thanks!


-Olof
