Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC75248370
	for <lists+linux-omap@lfdr.de>; Mon, 17 Jun 2019 15:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728017AbfFQNFa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Jun 2019 09:05:30 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41734 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725983AbfFQNF3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Jun 2019 09:05:29 -0400
Received: by mail-lj1-f196.google.com with SMTP id s21so9204506lji.8
        for <linux-omap@vger.kernel.org>; Mon, 17 Jun 2019 06:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mvdHu20wxBSx5VDFsQC67sWAK16V3Gtj/wNQ1YO9YVk=;
        b=nk9siVh81G5JnaRrCPkGyYwpA89hWIdO69zuQ8N5H1ssDvSm3hatsAs+fhwSgC2wIE
         w0FWU7PHPgr3DbE/2r74Q3wyTUarc/ngfhJHiuj0ilZG40K+CL7Rswpx3nvkHF3hbsEb
         ksoTbGv+zds2ZjTnRxveTJjjeGyC/dJJEaBrwPBmuZ5q0n6fkBXXo1/XbImtKwWOGhSd
         3qf3FyHghXpSVD3ojdBvSdETAsVY1GGwuWqRJFh+8MafVNKcfrQmCnJGbVduu/Sj951P
         yrgZ4q+RB6pSawsKAEOG+gdrRyfTrihMPO2RSM3rNgqIXxctROcKG4Qdw9pWc3Z7CwpY
         VDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mvdHu20wxBSx5VDFsQC67sWAK16V3Gtj/wNQ1YO9YVk=;
        b=KGQqsZNkZcldin2ljlsZMzlG/HQvTzqTvn/u51sZem6nC8RsfH0ncEz8frSKryGwVT
         agkOTCYNv0SBGjESrSeSLRHF4HnnU/4SLvUjHbsViYUxME++8r/r/9FRb7G5iFvyNFo3
         3QlKOQakXzs9qWLYMSWEjGTvoYFCWgcVHfikFZ3enukwY9s4raFIlKIfJSCf36mfdO7K
         PfbcZ4n5Z2cC/uxQXUWWCyxCnRCBAmzzz6G+O9D30+2qFR0G0S6+BhOllk7i1AwTPmbV
         OZ7JlbdXLmBM426wKanIcbV20ERsVYbvOH1XrV8vutJufbKNpMfb//RJ8tqiWRFlkcRN
         OePA==
X-Gm-Message-State: APjAAAXEZxRJ9rPIAQ9ZtML7XmsOGrYipaMVx+5Hb+BahedJHOFM3zk7
        EfDM1NsHbDTMS1iubHtYLU5/8u4Qx8Uhmw==
X-Google-Smtp-Source: APXvYqzCj9iDOootsPR0RV6qi1G3yRvFWFDRqPqbDBoMudDadtsnQIOz5bY9WRuBVk1pWTIL/LaPjQ==
X-Received: by 2002:a2e:989a:: with SMTP id b26mr30269890ljj.31.1560776727896;
        Mon, 17 Jun 2019 06:05:27 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id m26sm1737721lfj.37.2019.06.17.06.05.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2019 06:05:26 -0700 (PDT)
Date:   Mon, 17 Jun 2019 05:17:25 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Tony Lindgren <tony@atomide.com>
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 1/4] soc changes for omap variants for v5.3
Message-ID: <20190617121725.tcyrjpoillqh6n6f@localhost>
References: <pull-1560399818-512977@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pull-1560399818-512977@atomide.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Jun 13, 2019 at 12:10:50AM -0700, Tony Lindgren wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.3/soc-signed
> 
> for you to fetch changes up to 45450f36e569e5162957df488b0174c9a952e1b0:
> 
>   soc: ti: pm33xx: Add a print while entering RTC only mode with DDR in self-refresh (2019-06-10 05:19:26 -0700)
> 
> ----------------------------------------------------------------
> ti-sysc soc changes for v5.3
> 
> Just two changes to make few platform data functions static, and to
> call dev_info() if am437x is suspending to RTC-only mode. We want to
> see this in case of issues as it depends on the board wiring for things
> like DDR memory.

Merged, thanks!


-Olof
