Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 593A43E177C
	for <lists+linux-omap@lfdr.de>; Thu,  5 Aug 2021 17:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238638AbhHEPE6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Aug 2021 11:04:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230183AbhHEPE6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Aug 2021 11:04:58 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CE38C061765
        for <linux-omap@vger.kernel.org>; Thu,  5 Aug 2021 08:04:43 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id g21so8874356edb.4
        for <linux-omap@vger.kernel.org>; Thu, 05 Aug 2021 08:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZXj+/MzIh8TUaHnTl21vLV+r81+xZuq+H+PEdDDidP8=;
        b=Mf2dsHWy37tUUIuN3qvDKQd4LLUZT9O7337Zx9Tqj5aWjYxkBRsCWBc5bo9LbaOO3G
         MhhwdPdwhZYZNNp9Zp/KwLsVyAn4Hc3ZTSQKJpuv1khamx99SshXut4lrhoelJk2EWGw
         +U4TPPgZts2Vtp2ZZCJylwOs0YA5VUVngYwrJrF1Mu/kxyI5Tf87csoNkTp3mksu0Hrg
         YmPM9niHpX6pmdLn07DrR9kw9V9OqkYVomF/1k7TtV81DObi/skRwzq/6IPnGZ8enuQo
         7jCt0jJ8Fe79b1eIcK+G3gPXgcGgNIzpCP0PtceMF9+fSi/eXOsYuJyMWYl51fHlkTxC
         lftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZXj+/MzIh8TUaHnTl21vLV+r81+xZuq+H+PEdDDidP8=;
        b=VdsMNpXGM6PVg2LAmXvR8A8ikrRyNFiKW0yx2PjZBn6pZaEb49SguuwwpDmgxhk1jg
         HXzhEwe6iD6tQWwWdp80dfvx2gENnAjcbuP2oNgMzByKjbVe5t27vQdZ9iRg0jwU5U1a
         sWbSUkBchjN+n332Fl39tND3tOWvP4hgvNPf0f3cuGnqXeO2wElf2wWXPhen/AzIXj1U
         botxsAbTpZk/9QtjIBpeISgvTIPJnVL3vv/mF063WjMjLH40YICs1kCs/iAL236f3k16
         RVN/vQCXY3A9t7dWkQ9X3VDo0OYYSpdsjLMRCInnFVuu8AkGoOLwZ8ufwbzSuv1GuZmJ
         +0rQ==
X-Gm-Message-State: AOAM530RVGBKeK1UN8mheFacV0I2054WmFg4AaB/Fv8ui4CNAiQECq+0
        8OqK8ZuOeEKNsegtHszs/kFzQRTKyqQOtQ3+AFY=
X-Google-Smtp-Source: ABdhPJzywjAqfdEs/kl8ZpylY9wi4+KxSaLm6sDbYK7d7LXNE5AtAXC5hnZMgKV9AjGa55x3rmizGdPODWXuJDt9BJg=
X-Received: by 2002:aa7:d8d4:: with SMTP id k20mr7033582eds.373.1628175881637;
 Thu, 05 Aug 2021 08:04:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210613125105.786984-1-pbrobinson@gmail.com> <YP/Epx04Za2wiSlt@atomide.com>
In-Reply-To: <YP/Epx04Za2wiSlt@atomide.com>
From:   Peter Robinson <pbrobinson@gmail.com>
Date:   Thu, 5 Aug 2021 16:04:30 +0100
Message-ID: <CALeDE9OC+OAuGaNM+iEO44bg+QAdjTE3NQkSdLLZUb-OXeo4Xg@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm: omap2: Drop MACH_OMAP3517EVM entry
To:     tony@atomide.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

> * Peter Robinson <pbrobinson@gmail.com> [210613 15:51]:
> > The MACH_OMAP3517EVM was added back in commit 549f95ed2016 due to
> > being used by the ASoC driver, but this driver was dropped in
> > commit 2c2596f3ab25 as the audio for this board had been moved to
> > a simple-audio-card configuration so MACH_OMAP3517EVM is now
> > properly unuused and can be dropped.
>
> Applying into omap-for-v5.15/soc thanks.

Was that all 3 of the series or just this one patch, I only see the
one for your 5.15 PR.

Regards,
Peter
