Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 814C444D3F6
	for <lists+linux-omap@lfdr.de>; Thu, 11 Nov 2021 10:22:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231739AbhKKJYs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 11 Nov 2021 04:24:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbhKKJYr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 11 Nov 2021 04:24:47 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E092C061766
        for <linux-omap@vger.kernel.org>; Thu, 11 Nov 2021 01:21:58 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id k37so12712783lfv.3
        for <linux-omap@vger.kernel.org>; Thu, 11 Nov 2021 01:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=upzcV63NGKfkcgiX0pF2jdWcUrYxKUE4MnPXAlmhZ24=;
        b=xITzxxjhV5bA9MTZ9uG5YUE2S5tR5hlBgqhBgSx0uLF2Q9yNZovs+KT6z1In0PQJNh
         0OyAKYXNaT1139a6RzIJ9T1IbxrrR7vAOQngnXWq7J232baYxeSQG8PKMYWR9xVLK+xa
         BhUgCP9a9R4hNZLRj+KlDiwlj2q35fPONGGsLtkVHMa3pq/4QUmS+oVBF+CAeYaXrcjX
         L4ln7EuawMiSAWgSda7TS9arDP6yB5uAzps91Pr9kVD7WQB3WqBuvjrQcBNU7P7hnVGv
         0WfhqrsXGO640evD5yam0MQOsRn1S+AeAgnatB12p1jRtgeG5KqwqAwVDrSNWXNjJyyy
         /Umw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=upzcV63NGKfkcgiX0pF2jdWcUrYxKUE4MnPXAlmhZ24=;
        b=3wvCdSfyWIlsL7tVhW0xib7krh8x5vLSTuD0blGS6Xtx1mKUykcLZ664UdO2pwNm/L
         Ns930Ix3ckjkMQNGS2yGd4Ym+D5Dn5tYvWzI1CUsFsxzTW5FIE+kParWIang2mGvTbag
         B6OvS0XmaRhlj/vuE7+1ZdUzWDGop5C2iSOiT87z6p3TBWqGT3sI0xi7KgKx2kXrgfOO
         ZZP2FLxqdhl6N9F8RhmDcW0C5cPLGpDUK4QNRXBzQ0lOrV7zZpcNwxuqmJubH9Fqz7Yu
         aEwh2OzBCY+E4NHSElOT/upJY08LMQhy8Uvgk3fjheneader95ZghdKRai9Atz9n4XEz
         rqqA==
X-Gm-Message-State: AOAM532NrO7xJXEGtX456nCnObaZJLYuggU+TDFdbgU8IVCj5qX1UasR
        v2J5B+00j8w49oxpdmHYCFLk5mtAyqaq4OM3YS9qjQ==
X-Google-Smtp-Source: ABdhPJwltgmgxSoCafwjV++Ud4heliO80/2F+tNg3MhJJVkgjUldFy5JKooQdnOSvoRB1dfX8e9S2gCDAEl+Lj9sX4c=
X-Received: by 2002:ac2:5a46:: with SMTP id r6mr5589070lfn.358.1636622516569;
 Thu, 11 Nov 2021 01:21:56 -0800 (PST)
MIME-Version: 1.0
References: <cover.1636564631.git.hns@goldelico.com> <e7936cff7fc24d187ef2680d3b4edb0ade58f293.1636564631.git.hns@goldelico.com>
 <857E13BF-020B-4184-801D-783ADBDC42A1@goldelico.com>
In-Reply-To: <857E13BF-020B-4184-801D-783ADBDC42A1@goldelico.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 11 Nov 2021 10:21:19 +0100
Message-ID: <CAPDyKFqMm18GuTk9=v==iVxKa=SWLj2Xh6acoK=N6dVJJ6Xiaw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] mmc: core: Fixup storing of OCR for MMC_QUIRK_NONSTD_SDIO
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     =?UTF-8?Q?Gra=C5=BEvydas_Ignotas?= <notasas@gmail.com>,
        linux-mmc@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <Jerome.Pouiller@silabs.com>,
        Avri Altman <avri.altman@wdc.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Bean Huo <beanhuo@micron.com>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Yang Li <abaci-bugfix@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 10 Nov 2021 at 18:20, H. Nikolaus Schaller <hns@goldelico.com> wrote:
>
> > Am 10.11.2021 um 18:17 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
> >
> > From: Ulf Hansson <ulf.hansson@linaro.org>
> >
> > The mmc core takes a specific path to support initializing of a
> > non-standard SDIO card. This is triggered by looking for the card-quirk,
> > MMC_QUIRK_NONSTD_SDIO.
> >
> >       if (card->type == MMC_TYPE_SD_COMBO) {
> > --
> > 2.33.0
> >
>
> Sorry, I just recognised after pressing the send button that with "early"
> you probably meant this to be 1/6... Should I resubmit?

No need to re-submit, this works fine!

Kind regards
Uffe
