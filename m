Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2249B3E4212
	for <lists+linux-omap@lfdr.de>; Mon,  9 Aug 2021 11:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234176AbhHIJH5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Aug 2021 05:07:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234062AbhHIJH4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Aug 2021 05:07:56 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 662F1C0613CF
        for <linux-omap@vger.kernel.org>; Mon,  9 Aug 2021 02:07:33 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id f5so4622047wrm.13
        for <linux-omap@vger.kernel.org>; Mon, 09 Aug 2021 02:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/ZPOlrNFMpNUTPbgUazrf5s5awBfvFWEx4XOmYGlmFM=;
        b=xuTbN9NL08Xcyq4YkCIGhzlEKVrVctUgSIIhVBnkaX8eBSEHaFOlZ6xhpHC8lMNFIe
         dwmLzw6HSzfSkmDyldkyO4cF/B4FSaQ+R0e3imf9Uqwu/s1kxF6cO7lgFBnp2CQiHQZb
         ptygmaW+KOYy2Vg86ysWX42PDO7BrZXZJ2slJRdSO2oCp1BIbrBre/fMom8tMKlqVz0H
         YgsuS74yevpikRF9h2yy5vlV8pLKC5hbNzRmJXeGnXWlCyldErZ0DwkZjzAc6HNz0Ks0
         do7m4j3JuvYi7N6B2LzEz8XuzVlzUZp+/3EnES80Duj6XTL4TcUfvLUOpI6PI0+bVEHc
         haRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/ZPOlrNFMpNUTPbgUazrf5s5awBfvFWEx4XOmYGlmFM=;
        b=gkNWTRM6yo1PCDlZavtJ3euy2p6RhXpOvuNSWWPMxZzAOycSdvYbY2NKNwGjNYOiVr
         KmNF6fsYrXXDBwSLkNVtLWDXVwTwdpY1TW127hCJBHJhaZF0vl1baQgZy85BP6EqGSdP
         MQoXqep2l+DV8eg0WUQHogfB3r3e1uf8rWtH7mu0A8jAfE/1wfuDjgXMyRbDEw/5uW97
         plrr2rtinSuCrIpkeBt++p20xZEzq8cpQrx/zIKaEGuYyZHG50Ss2UCXGmH3xs4+Zmaq
         hJdtqGoJWcLpG/bM7mQ1VFnDXtneT6hLq1s5OfiPUnAQU/pRPkT7V0BffLY028dU/kWX
         7A7w==
X-Gm-Message-State: AOAM532G1gNJBu14LOi8npvkmyTZT+ph0N642CffeZvWxDA2TLe/ieWa
        /uoTWTFK6o7lNks+z0g1Q02+Cw==
X-Google-Smtp-Source: ABdhPJyLRv8OWaU2rJjJ7UBftQqOajWt7JIwvnGbG61bADURpPUKgdSk4u6IhZ36haGe/OcsoLIAnw==
X-Received: by 2002:a05:6000:1106:: with SMTP id z6mr24270092wrw.296.1628500051979;
        Mon, 09 Aug 2021 02:07:31 -0700 (PDT)
Received: from localhost ([86.61.181.4])
        by smtp.gmail.com with ESMTPSA id v17sm18937438wrt.87.2021.08.09.02.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 02:07:31 -0700 (PDT)
Date:   Mon, 9 Aug 2021 11:07:30 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Leon Romanovsky <leon@kernel.org>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Leon Romanovsky <leonro@nvidia.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>, Ariel Elior <aelior@marvell.com>,
        Bin Luo <luobin9@huawei.com>,
        Claudiu Manoil <claudiu.manoil@nxp.com>,
        Coiby Xu <coiby.xu@gmail.com>,
        Derek Chickles <dchickles@marvell.com>, drivers@pensando.io,
        Felix Manlunas <fmanlunas@marvell.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Geetha sowjanya <gakula@marvell.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        GR-everest-linux-l2@marvell.com, GR-Linux-NIC-Dev@marvell.com,
        hariprasad <hkelam@marvell.com>,
        Ido Schimmel <idosch@nvidia.com>,
        intel-wired-lan@lists.osuosl.org,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        Jerin Jacob <jerinj@marvell.com>,
        Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Jiri Pirko <jiri@nvidia.com>,
        Linu Cherian <lcherian@marvell.com>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev, Manish Chopra <manishc@marvell.com>,
        Michael Chan <michael.chan@broadcom.com>,
        netdev@vger.kernel.org, oss-drivers@corigine.com,
        Richard Cochran <richardcochran@gmail.com>,
        Saeed Mahameed <saeedm@nvidia.com>,
        Salil Mehta <salil.mehta@huawei.com>,
        Satanand Burla <sburla@marvell.com>,
        Shannon Nelson <snelson@pensando.io>,
        Simon Horman <simon.horman@corigine.com>,
        Subbaraya Sundeep <sbhatta@marvell.com>,
        Sunil Goutham <sgoutham@marvell.com>,
        Taras Chornyi <tchornyi@marvell.com>,
        Tariq Toukan <tariqt@nvidia.com>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        UNGLinuxDriver@microchip.com, Vadym Kochan <vkochan@marvell.com>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        Yisen Zhuang <yisen.zhuang@huawei.com>
Subject: Re: [PATCH net-next] devlink: Set device as early as possible
Message-ID: <YRDwUrOK1YHsK7CE@nanopsycho>
References: <6859503f7e3e6cd706bf01ef06f1cae8c0b0970b.1628449004.git.leonro@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6859503f7e3e6cd706bf01ef06f1cae8c0b0970b.1628449004.git.leonro@nvidia.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Sun, Aug 08, 2021 at 08:57:43PM CEST, leon@kernel.org wrote:
>From: Leon Romanovsky <leonro@nvidia.com>
>
>All kernel devlink implementations call to devlink_alloc() during
>initialization routine for specific device which is used later as
>a parent device for devlink_register().
>
>Such late device assignment causes to the situation which requires us to
>call to device_register() before setting other parameters, but that call
>opens devlink to the world and makes accessible for the netlink users.
>
>Any attempt to move devlink_register() to be the last call generates the
>following error due to access to the devlink->dev pointer.
>
>[    8.758862]  devlink_nl_param_fill+0x2e8/0xe50
>[    8.760305]  devlink_param_notify+0x6d/0x180
>[    8.760435]  __devlink_params_register+0x2f1/0x670
>[    8.760558]  devlink_params_register+0x1e/0x20
>
>The simple change of API to set devlink device in the devlink_alloc()
>instead of devlink_register() fixes all this above and ensures that
>prior to call to devlink_register() everything already set.
>
>Signed-off-by: Leon Romanovsky <leonro@nvidia.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
