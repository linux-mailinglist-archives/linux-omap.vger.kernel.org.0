Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42CFB484FCC
	for <lists+linux-omap@lfdr.de>; Wed,  5 Jan 2022 10:10:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231499AbiAEJK4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 Jan 2022 04:10:56 -0500
Received: from sender11-of-o51.zoho.eu ([31.186.226.237]:21133 "EHLO
        sender11-of-o51.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbiAEJK4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 5 Jan 2022 04:10:56 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1641373832; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=GJYKqyWhdJlXFR45O4wYWdHIWczRxk6BDOMaKucWOL9YxWyXR/yetmFSQk2x/du6iy1/I1uV1FnnL+GSHXCgMzZtect5BiWN6yZ91iMrNtc/+fzrF7RZt5pG/9SVE+KSYP88r550q0EmCNP3kQt5qjOiPPUqF0g9UGNx5Ie0w4A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1641373832; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=oPNfawC90lftrQQuBSvQ6SfphKGqT7CocEJaoV8xMDw=; 
        b=TFEgnjDDJaSst70MFfNdqP8iYxZ30vOk/9uApzt1NXG7tWunlScPHqDN/SoLaylZ3huJwiMjWjxIlZmEiDdAIl9XktRKT2zmlxmzVbOlB8ndcwe8awIQRESgiXXXxea9XP0EDDxEgT7SbZC8QQjEfR61XqbLoKvhAFKdYKyGf3s=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz>
Received: from UVOSLinux (aftr-37-201-192-123.unity-media.net [37.201.192.123]) by mx.zoho.eu
        with SMTPS id 1641373829850604.0765913733462; Wed, 5 Jan 2022 10:10:29 +0100 (CET)
Date:   Wed, 5 Jan 2022 10:10:28 +0100
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     kuninori.morimoto.gx@gmail.com
Cc:     alsa-devel@alsa-project.org, merlijn@wizzup.org, tony@atomide.com,
        sre@kernel.org, linux-omap@vger.kernel.org,
        kuninori.morimoto.gx@renesas.com
Subject: Re: [RFC PATCH 1/3] ASoC: simple-card-utils: add support for
 componants provideing jack events via set_jack
Message-Id: <20220105101028.620b7f2cb7727eedfccd933e@uvos.xyz>
In-Reply-To: <87a6gawxpe.wl-kuninori.morimoto.gx@gmail.com>
References: <20211228190931.df5d518220080a734532ebfd@uvos.xyz>
        <87a6gawxpe.wl-kuninori.morimoto.gx@gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

> I'm sorry but I don't understand what you want to do by this patch.
> Is main code of this patch asoc_simple_dai_init() update
> (= call set_jack() for all component) ?

Yes, so asoc-audio-graph-card currently only supports headphone jack plug
detection on devices that provide a simple gpio to sense plug state. The
intent of this patch is to allow the componant driver to implement jack
detection in cases where something else has to be done to sense state,
sutch as comunicating with device firmware or using a shared irq. See
the other patches in this series for an example. This is performed by
sharing the jack with the component via set_jack().
 
> ${LINUX}/sound/soc/fsl/fsl-asoc-card.c is using this function, too.
> We will have compile error without update it.

indeed, will do.

> > +		sjack = devm_kzalloc(dev, sizeof(*(*sjack)), GFP_KERNEL);
> > +		sjack_d = *sjack;
> 
> Am I misunderstanding ?
> I think you need to do here is this ?
> 
> 	-	sjack = devm_kzalloc(dev, sizeof(*(*sjack)), GFP_KERNEL);	
> 	+	*sjack = devm_kzalloc(dev, sizeof(*(*sjack)), GFP_KERNEL);

Ah yes thank you, another problem is i lack hardware to test this (the gpio) path.

-- 
Carl Philipp Klemm <philipp@uvos.xyz> <carl@uvos.xyz>
