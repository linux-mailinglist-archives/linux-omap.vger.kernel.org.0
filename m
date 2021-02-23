Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 211183231A3
	for <lists+linux-omap@lfdr.de>; Tue, 23 Feb 2021 20:53:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232227AbhBWTxU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Feb 2021 14:53:20 -0500
Received: from mail-wr1-f53.google.com ([209.85.221.53]:43422 "EHLO
        mail-wr1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231719AbhBWTxT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 23 Feb 2021 14:53:19 -0500
Received: by mail-wr1-f53.google.com with SMTP id w11so1131617wrr.10;
        Tue, 23 Feb 2021 11:53:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q5g0X8+sVSveFroJjg1Oe6VYsVSwESFscNmYOxJrFSg=;
        b=foYT59CZ3O/WhuP/TS/QvYO0uCgVfLOU+4SgL6pBmTySXk5Dctz6kJtGDgDPyjZwLR
         He4raVuGpGluBXGwJHBMHRC8fNyAwFylsmYwC6kEX7uBByudYQKUUK8CrgtsbKXg7ouG
         t6hzCbyUlGLQjCRuXe73KGr6C183LeoI0ffs+gyS1VlsfyOG8SGYrROMz0j8R/Ts7b/U
         1Je/4lE4nWQObtx1fDwdke/6YdfmK1WddKOA7hnBtBSR5wMQbHCYSnezclBaUkCvaXIO
         Vkc4SMsJQIq257+VtmddvkJeVoIQaR6so0G12YVdRVq4hiaX/0FSFqWkYKABCrLYViS2
         Ge2Q==
X-Gm-Message-State: AOAM532WRgmwA8aSSXsIN49u1PmuxkR3jzHf+CV5K2NfneJwIThhDABs
        Mne0xdWC6MDIv0T2oDBR8Bs=
X-Google-Smtp-Source: ABdhPJwrViQ5156nJm67yUTcXPZI9jYiI0sF+jqdg83DF+SQtgDcxmQGXWUn0jHp8eR1I34ABPnw+A==
X-Received: by 2002:adf:f750:: with SMTP id z16mr25990808wrp.108.1614109956949;
        Tue, 23 Feb 2021 11:52:36 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id h20sm3713924wmb.1.2021.02.23.11.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 11:52:36 -0800 (PST)
Date:   Tue, 23 Feb 2021 20:52:34 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] memory: gpmc: fix out of bounds read and dereference on
 gpmc_cs[]
Message-ID: <20210223195234.cqird4txhokvbfjj@kozik-lap>
References: <20210223193821.17232-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210223193821.17232-1-colin.king@canonical.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Feb 23, 2021 at 07:38:21PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the array gpmc_cs is indexed by cs before it cs is range checked
> and the pointer read from this out-of-index read is dereferenced. Fix this
> by performing the range check on cs before the read and the following
> pointer dereference.
> 
> Addresses-Coverity: ("Negative array index read")
> Fixes: 186401937927 ("memory: gpmc: Move omap gpmc code to live under drivers")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/memory/omap-gpmc.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Thanks, looks good. I'll take it after merge window.

Best regards,
Krzysztof
