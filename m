Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 093A222C77C
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 16:11:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726639AbgGXOLM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 10:11:12 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:34669 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgGXOLM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Jul 2020 10:11:12 -0400
Received: by mail-wm1-f65.google.com with SMTP id g10so8683683wmc.1;
        Fri, 24 Jul 2020 07:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=A9vjVNh+Xzd6zKN6RvLmeY0dNVwxU7fOoaRRb6t5xa8=;
        b=ZxBwGNmf0Sc5FmvxGFVFInD2xv+njBP1aCrNxzeMDuc377rQCe+A/0Ndv1952O8Bic
         lIpr/Wri5q/9WzAAbFyhpcvp3MZn68GJeikGBOq/w5QANdq1xFysxF5ze4ySPDKISHc7
         AzauMhoBl0GAwVd/0IB1uZfBnIDKLTZxB9xB+7AGRfaC6UBWgUcqAnHrQ5ITJjlnlDSO
         t5zoQMSWan3CPtduP8ACzvQA9s3Za3yHzK3PzGpakBqfYx1L1ORLmLKVFE2P42PiKG7o
         w+H0ien8Ay55LMbNr8aiNp084G+RQkiEQO0GUufGHfj7XohuHyuKQvbtuQFcTA4L93LH
         8l7A==
X-Gm-Message-State: AOAM533zuaBOo4zMRk3qg0woiobuNbZG/+lxQxEeiBWLKjAJhmPZvADB
        6C5nFV7Bc4lIgiNUx78z4yc=
X-Google-Smtp-Source: ABdhPJz3aD933VZnlcL2lyFXk2MIAVE5alwfIVb1d+ILWvaUq6pkspzSLCjLp3FksVGQR+JIWdH11g==
X-Received: by 2002:a7b:c936:: with SMTP id h22mr8449055wml.114.1595599870112;
        Fri, 24 Jul 2020 07:11:10 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
        by smtp.googlemail.com with ESMTPSA id z15sm684433wrn.89.2020.07.24.07.11.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jul 2020 07:11:09 -0700 (PDT)
Date:   Fri, 24 Jul 2020 16:11:06 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Markus Mayer <mmayer@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Roger Quadros <rogerq@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Kukjin Kim <kgene@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 13/29] memory: emif: Fix whitespace coding style
 violations
Message-ID: <20200724141106.GE14851@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-14-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-14-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jul 24, 2020 at 09:40:22AM +0200, Krzysztof Kozlowski wrote:
> Make the code and printed messages slightly more readable.  Fixes
> checkpatch warnings:
> 
>     WARNING: quoted string split across lines
>     ERROR: space prohibited before that ',' (ctx:WxW)
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/memory/emif.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 

Applied (and part of pull request to arm-soc).

Best regards,
Krzysztof
