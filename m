Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36DE332B0F6
	for <lists+linux-omap@lfdr.de>; Wed,  3 Mar 2021 04:46:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234932AbhCCAmU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 2 Mar 2021 19:42:20 -0500
Received: from mail-wm1-f52.google.com ([209.85.128.52]:40678 "EHLO
        mail-wm1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377912AbhCBIpn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 2 Mar 2021 03:45:43 -0500
Received: by mail-wm1-f52.google.com with SMTP id o2so1274482wme.5;
        Tue, 02 Mar 2021 00:44:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GAhLBbf8ZlSFNBx4M5no+EdybG1cs4984X+1+9hKO1g=;
        b=ItSA5ro3TXqfVM5e5djg7Q9H20/2IIX10+1n4xjXXve4rXzXPkp68qzID3EDvS1Puv
         cuhwgBgSxRVQ8vJJggR0hAmy4OolN75oYHH+qRF3yc+LXQGJ0Z0PLiEe6nGLa7xhp2Ca
         BW4TMP+wPcHw8SKM+7zKWu7F8cDC/2Fp/Di0HV4iZuKzSjB1OKa3cbDY8s26Eo8m+/AG
         5XTBc9rtXypnnQG7oRj23yW62357qKgwCL3uhuJ5C+zB0Ar3yo9fCwjor5Mo2bbGLvuI
         delRebYEs+UY3xrHQxIXILrDHuWFaZlJaeZI2ZXnc42MoAhi9AsAuJb3o7ZYh+FCcgBR
         U7AA==
X-Gm-Message-State: AOAM531m+rqpF3w6+EHsKjq2T6kgAXF9FFmDdPo+lmy5Ds6FBj4IIspU
        eRPlLhEJJ1GZW4AywdiMf3IGGKEgXRE=
X-Google-Smtp-Source: ABdhPJx1/WK/3xpuhIFqxu52CKbU7Su9ci/Mc1E21C2pUzv+kmese+U83CsR6azy0Zs53usMShavRA==
X-Received: by 2002:a7b:c353:: with SMTP id l19mr2885236wmj.147.1614674644673;
        Tue, 02 Mar 2021 00:44:04 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id x13sm27119661wrt.75.2021.03.02.00.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 00:44:03 -0800 (PST)
Date:   Tue, 2 Mar 2021 09:44:02 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] memory: gpmc: fix out of bounds read and dereference on
 gpmc_cs[]
Message-ID: <20210302084402.4qw7ltj4ivcoxs4t@kozik-lap>
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

Thanks, applied with Tony's ack and changed Fixes to 9ed7a776eb50 ("ARM:
OMAP2+: Fix support for multiple devices on a GPMC chip select"). 

Best regards,
Krzysztof

