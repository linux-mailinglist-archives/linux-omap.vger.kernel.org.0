Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68A27381927
	for <lists+linux-omap@lfdr.de>; Sat, 15 May 2021 15:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231218AbhEONtQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 15 May 2021 09:49:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbhEONtP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 15 May 2021 09:49:15 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E11C061573
        for <linux-omap@vger.kernel.org>; Sat, 15 May 2021 06:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=anKBymgnV/tODd0u/4/IiAF/ib1DIenWzaQ34RWuUi0=; b=kM/YC6hp9VVB+B2JTbc3qaL+xw
        0jZ907Bn6rAq+VTXx9RWqTeP6p3MfQHVCDA0AFzdYdyvH0iQet93NPOIVA69o1b9XQTbvZkJITWQV
        s/zejWz9w3l+qOJQQdj+N8uRC/PjDUB23dK1a20xck9vXOVBg3KGEaJ3RgKtoVtgkxQY=;
Received: from p200300ccff3902001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff39:200:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1lhue7-0000kq-7B; Sat, 15 May 2021 15:47:59 +0200
Date:   Sat, 15 May 2021 15:47:58 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-omap@vger.kernel.org
Subject: Re: Status of ti/ti-linux-5.10.y development
Message-ID: <20210515154758.5b1b4fc5@aktux>
In-Reply-To: <78852763-4bc3-dc59-02c4-b3b07584c0ed@lucaceresoli.net>
References: <78852763-4bc3-dc59-02c4-b3b07584c0ed@lucaceresoli.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Fri, 14 May 2021 10:30:50 +0200
Luca Ceresoli <luca@lucaceresoli.net> wrote:

> Hi,
> 
> I hope this is the proper place for this question. If it isn't: my
> apologies, and I'd be glad to be redirected where appropriate.
> 
> I currently have a prototype board based on AM5728 that is mostly
> working, using branch ti/ti-linux-4.19.y of the TI kernel [0].
> 
> Now I need some non-TI-specific kernel features that appeared in
> mainline 5.10, so I tried to move to branch ti/ti-linux-5.10.y. But many
> components that I am using on the 4.19 branch seem absent on the 5.10
> branch, including VIDEO_TI_VIP, DRM_OMAP_WB and DRM_OMAP_CONNECTOR_HDMI.
> 
Wasn't the DRM_OMAP_CONNECTOR_HDMI replaced with something generic when
also omapdrm started to use the generic panel support, was it? So HDMI
connectors should work with mainline.

Regards,
Andreas
