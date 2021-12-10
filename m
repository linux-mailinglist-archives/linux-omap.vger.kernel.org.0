Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A867470B3A
	for <lists+linux-omap@lfdr.de>; Fri, 10 Dec 2021 20:59:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237462AbhLJUDZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Dec 2021 15:03:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236659AbhLJUDZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 10 Dec 2021 15:03:25 -0500
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5132C061746
        for <linux-omap@vger.kernel.org>; Fri, 10 Dec 2021 11:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=RIYuEmIJglddSgpF5lxKmbsIHhZKr990t5Gtwx3mKqM=; b=O3O+Wx3Ao7eK+CC2DOUa45qn2v
        vnVZd1oLGrGfLTV/pfYYR+Bs/SbB1117N0HEgIBbmHCk7UTcgN/2EqcQ7oD/Y6e63oD2ktg0sURgo
        naiQSRfBeXCMxDvZ6gyxu6nQ95ceCnY2i7z3/E+aTcjRu2SQOsZyNKVNtFiP7SKgdj/4=;
Received: from p200300ccff0e7a001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0e:7a00:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1mvm3W-0006C6-GV; Fri, 10 Dec 2021 20:59:46 +0100
Date:   Fri, 10 Dec 2021 20:59:45 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Merlijn Wajer <merlijn@wizzup.org>
Cc:     linux-omap <linux-omap@vger.kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Dev Null <devnull@uvos.xyz>, Pavel Machek <pavel@ucw.cz>,
        Tony Lindgren <tony@atomide.com>
Subject: Re: Nokia N900 increased power draw with panel-sony-acx565akm
 loaded v5.9 and v5.10
Message-ID: <20211210205945.747b2f97@aktux>
In-Reply-To: <001a77db-80c0-d000-3d78-b9b301669826@wizzup.org>
References: <001a77db-80c0-d000-3d78-b9b301669826@wizzup.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Fri, 10 Dec 2021 20:18:35 +0100
Merlijn Wajer <merlijn@wizzup.org> wrote:

[...]
> * 21b2cec61c04bd175f0860d9411a472d5a0e7ba1 (mmc: Set
> PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.4)
> 
just for the records, I have a fix for that commit which also went into
stable, so this is not an additional contruction site:

commit ec76c2eea903947202098090bbe07a739b5246e9
Author: Andreas Kemnade <andreas@kemnade.info>
Date:   Fri Dec 4 10:55:39 2020 +0100

    ARM: OMAP2+: omap_device: fix idling of devices during probe

Regards,
Andreas
