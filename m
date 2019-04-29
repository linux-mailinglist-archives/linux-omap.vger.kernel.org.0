Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1D34DC40
	for <lists+linux-omap@lfdr.de>; Mon, 29 Apr 2019 08:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727246AbfD2GzR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Apr 2019 02:55:17 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33140 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727173AbfD2GzR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 29 Apr 2019 02:55:17 -0400
Received: by mail-lf1-f65.google.com with SMTP id j11so7110899lfm.0
        for <linux-omap@vger.kernel.org>; Sun, 28 Apr 2019 23:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ViXw/lf4TfCaqZAJA/ayscALfbBnnynlxB3s2q++euI=;
        b=w/r4dGlVy/3p3S5Hf8IIJ5/BicdNfPr0uxEiP2F4BP0Duud2oMc4gpEBnRVm6E8arH
         QCSSvwxeaNKd03GHLDTgEfP0WGxhRBefeW+qZpMLyHD7O+Wpz1Wmlp7theKmkdkAxTuj
         PAF1SPhLDZQ9pMjYmV0zYcYtKFNh0vBIpIdg4J4+0eZ5Zz+hhflbMOP08ojUWs803z6t
         wiUBlJPwPg/AXntVwR5khON/SYe3hbWiuc1GYrbr0x94ehSBPkfeLGOL9+D2Cag3Vme0
         IyKJ2vf1P6x3BUrZKr6czurBxWuw9EZiCX24riKTxpFy8yUGyq9v8M9xmxgIinPmSc+X
         7Ewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ViXw/lf4TfCaqZAJA/ayscALfbBnnynlxB3s2q++euI=;
        b=bN2ZfTCK5/dokocvpK+ocmp8oLFbp20OQbpxuJOQ+tmOfCAz2vE1pQD+F/96nPbMI4
         M4eLZw7hJG++MT0HqJKQCwF2KlqecKK4Vl5FZkHL+LNrRBNG3glpyANaVIgTEiT4zAJk
         8uyBLDEyFg8BUv93zHDkCIZhHsjAOTOUW6ixcqnDicLDnBEGp1f3U+krUWBXhoY0KZnF
         DdVggC5O22bVXahAR7ICsKXnnbgTTqj/Zr/BwafU0Fu2I+tPuBfEGVoXClDFjWetPtz5
         IL7DIcWbxaa7O7BVwqCG3qsxSSQOxTGAVhmYeSomqd5Uc6gRswsv8+Pn+gkXFISPfHMK
         bWEg==
X-Gm-Message-State: APjAAAWi/Cp0ZgJJtzj0COcePOu2w99pN+V9MpMwl64L1C6ksOEDHHH6
        vj4oxikmsvJ10LK6RP4UTF5peQ==
X-Google-Smtp-Source: APXvYqwpGjKZmuvRiMk+BcHWxPQnvC03XUy3SCqS56zU/T9W2waRywWBysHx2euCS7YqwCqQE6HPpQ==
X-Received: by 2002:a19:428c:: with SMTP id p134mr32928239lfa.108.1556520915728;
        Sun, 28 Apr 2019 23:55:15 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id q12sm7125567lfa.37.2019.04.28.23.55.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Apr 2019 23:55:14 -0700 (PDT)
Date:   Sun, 28 Apr 2019 23:03:07 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Tony Lindgren <tony@atomide.com>
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 1/3] soc changes for omaps for v5.2
Message-ID: <20190429060307.5mb35baxsi5iqlcw@localhost>
References: <pull-1555087688-487222@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pull-1555087688-487222@atomide.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Apr 12, 2019 at 10:02:05AM -0700, Tony Lindgren wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> 
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.2/soc-signed
> 
> for you to fetch changes up to 72aff4ecf1cb85a3c6e6b42ccbda0bc631b090b3:
> 
>   ARM: OMAP2+: pm33xx-core: Do not Turn OFF CEFUSE as PPA may be using it (2019-04-09 08:05:17 -0700)
> 
> ----------------------------------------------------------------
> SoC changes for omap variants for v5.2 merge window
> 
> This series of changes mostly consists of ti-sysc interconnect driver
> related preparation work. With these changes and the related ti-sysc
> driver changes, we can start dropping legacy omap_hwmod_*data.c platform
> data for many devices.
> 
> There are also two am335x and am437x related PM changes for secure
> devices that have ROM handling some parts and needs EFUSE power domain
> active.

Merged, thanks!


-Olof
