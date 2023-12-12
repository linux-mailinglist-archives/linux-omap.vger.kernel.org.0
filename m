Return-Path: <linux-omap+bounces-155-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2242080EFFD
	for <lists+linux-omap@lfdr.de>; Tue, 12 Dec 2023 16:21:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0C011F2158A
	for <lists+linux-omap@lfdr.de>; Tue, 12 Dec 2023 15:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B1E7540E;
	Tue, 12 Dec 2023 15:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="IvrvKt2R"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a02:c205:3004:2154::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 531A183
	for <linux-omap@vger.kernel.org>; Tue, 12 Dec 2023 07:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8/7UY3Bhx9kOpWH0pljI90JTWKEClugcDBTPjZhXP9I=; b=IvrvKt2Ro9FYXn4zgx6sY8r6zl
	k7PKyiLzUyhm14tt0yTEl1QZnV/QE9IfhGJ21ZSL4vMaN1gkOPBcpke0/dX6mKmqZSUXZX2K1oKwp
	wjaM4qdD/Fo80ja6Zqybnbfcp8qHHgBZ3d53i1KP9t5DNwnC4gP2/OAtTKMNktLZRtoqh2fmh5xb2
	ulGCpojPcIsRQigz5i1JChmXhu+iP9XvN8TqHOYSKS0iDZ3Yy8zc+mjAbgI42L/ufiXBNXAngdQ5O
	B1/0ttz5R4Dw4LvoqboRjD6Th0xTGNJExrLJ0XsNRuOWHB2yawl3axs5pYIBQL5RuEtJIdGUuiF6P
	W8fPzubQ==;
Received: from p200301077700c3001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:107:7700:c300:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1rD4Zn-007JTV-Hw; Tue, 12 Dec 2023 16:21:39 +0100
Date: Tue, 12 Dec 2023 16:21:37 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Adam Ford <aford173@gmail.com>
Cc: Linux-OMAP <linux-omap@vger.kernel.org>, USB list
 <linux-usb@vger.kernel.org>, stern@rowland.harvard.edu, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: Re: ehci-omap unresponsive when used with external hub
Message-ID: <20231212162137.047f9337@aktux>
In-Reply-To: <CAHCN7xKGW4j6HsELJNbT10OyNX0zx2207nz=AQ97VxKJaEQkyg@mail.gmail.com>
References: <CAHCN7xKGW4j6HsELJNbT10OyNX0zx2207nz=AQ97VxKJaEQkyg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 12 Dec 2023 08:58:31 -0600
Adam Ford <aford173@gmail.com> wrote:

> I have been troubleshooting an issue with USB which appears to happen
> with  AM3517, OMAP3530,  and DM3730 in which the USB doesn't detect
> removal or connection of USB devices and interrupts stop occurring.
> 
> In every case, I have the OMAP3 EHCI connected to a USB3220
> transceiver which is treated as configured in the device tree as
> usb-nop-xceiv with reset-gpios configured to enable it.
> 
Also issues on GTA04 (DM3730):
The modem is behind it. There is an errata for that
combination.
Somehow reset/turning off does not work really. On GTA04
we have issues with current consumption during suspend.
including scenarios where there is a mismatch between state
of phy and what the omap side the state is.

What we do:
enable off-mode and force-reset of both sides.

and have this hack to solve at least the suspend issues:
https://lore.kernel.org/linux-omap/20180216171414.8097-1-andreas@kemnade.info/

Regards,
Andreas

