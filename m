Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 548FB2769EE
	for <lists+linux-omap@lfdr.de>; Thu, 24 Sep 2020 09:00:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbgIXHA6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 24 Sep 2020 03:00:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726950AbgIXHA6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 24 Sep 2020 03:00:58 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF31C0613CE;
        Thu, 24 Sep 2020 00:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Sender:
        Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=9cwTJAlRKK05nVk1Z4qLVE/mBcXjgRfZ0EvM7wGOtMY=; b=acYc7N8+OhlPAfMijESR0JWXqI
        vzvfZqD5oSFpxF261VO1xhTe4xfRxYimpv4mnqfakaFaIvJca6XiMgtxJpzrGVrVL+pOGataVQKZ0
        TT/0jezopzeqDSBJ0+suiPvZTkVTB1dlmJfLBII+ZzJzGv1MeFLQezBKBqzGPhKhgTyo=;
Received: from p200300ccff10b0001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff10:b000:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1kLLFI-0004Ab-Pw; Thu, 24 Sep 2020 09:00:49 +0200
Date:   Thu, 24 Sep 2020 09:00:47 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     khilman@kernel.org, tony@atomide.com, linux@armlinux.org.uk,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org
Subject: Re: [PATCH v2] omap3: enable off mode automatically
Message-ID: <20200924090047.2b61f883@aktux>
In-Reply-To: <20200911161209.25149-1-andreas@kemnade.info>
References: <20200911161209.25149-1-andreas@kemnade.info>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 11 Sep 2020 18:12:09 +0200
Andreas Kemnade <andreas@kemnade.info> wrote:

> Enabling off mode was only reachable deeply hidden
> in the debugfs. As powersaving is an important feature,
> move the option out of its shady place.
> The debugfs file can still be used to override the default.
> 
> Use the presence of a device compatible to ti,twl4030-idle or
> ti,twl4030-idle-osc-off as an indicator that the board is wired correctly
> for off mode.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
> An earlier version of this patch was here:
> https://patchwork.kernel.org/patch/10794121/
> 
> A config option was used instead of the suggested devicetree check.
> 
> Changes in v2:
> - fix compile without CONFIG_ARCH_OMAP3
>   The variable enable_off_mode is now always a real one and not
>   a preprocessor constant to avoid trouble with unusual configurations.
> 
Anything I still missed here? 

Regards,
Andreas
