Return-Path: <linux-omap+bounces-2505-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B02429B55C7
	for <lists+linux-omap@lfdr.de>; Tue, 29 Oct 2024 23:29:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1BD01C21090
	for <lists+linux-omap@lfdr.de>; Tue, 29 Oct 2024 22:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D450B20ADF0;
	Tue, 29 Oct 2024 22:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="2cjG4KSi"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729C6208237;
	Tue, 29 Oct 2024 22:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730240950; cv=none; b=e4iMBhWllsa3Eq1bpQkeGKA5NQvK2OT5IdXmCmzXvY68PIx9MMypuX7xYbFObfmkYrOj9wM67xfDuVe6uyd8xWJxWz6Bt/izTVPmlyTYciU2OQl/lGWTdU4fGRijRQFWs/hRUCbSJPrFbzLhWyUiAiZcL1CQX/66FBwjddMglsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730240950; c=relaxed/simple;
	bh=B5cggtVUK4KGwiiOHwTXT4Gi0NWheKTuvOBJkUQgfmY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DwXGrrN4Pes4M9A/eLfwno5km2bOL4LeVh3KL1Z7mZh3w5+LXVG7lCMOAVHJMzMv+ifasnSLdidcYsVCx/KwfxFqVYx/MOf3UXgrkzQukEyImqMHbOwkoayrzTRPq99wGskB5QtLUL1eZ2ifb4uRfiLJqpCuJGXustuzAN7Mmaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=2cjG4KSi; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=O0Al4d7ymvzfaP397i4wJ7+YNO+9GkagvW0GflXtcC8=; b=2cjG4KSiAlQkf+qd/vbIZWUiMI
	CK49mhoAABJMtlYdILc5Dcc23ePBNnzdBZUh0VstuEcWwhVs0FbMNMtTB3E81m5/m1OUd7+k4fArz
	8AYxEmH9b/yAqs5Avy+weLVYSKx+/nZ+tWZkls1kMPvkAmG/NbZRuK76DP5HZl7TcA3kfuUPX8yRs
	gq7BvP2tiFABT/swdjEwJPHtInm60pczO/uW/vh+BhmDzjk80L7UqvO4RsrCVxCfrV34MrWnLoTnb
	WM5BttiEt0qcJxzJeZViaWVyb4XFYX6T0PHZTex9PsxVjRFuOTF1S/sPODDBnV97tXSjUxRszxvIN
	qRvlRyDg==;
Date: Tue, 29 Oct 2024 23:29:02 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: MightyM17 <bavishimithil@gmail.com>
Cc: bcousson@baylibre.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, robh@kernel.org, tony@atomide.com
Subject: Re: [PATCH v2] ARM: dts: twl6032: Add DTS file for TWL6032 PMIC
Message-ID: <20241029232902.214db48e@akair>
In-Reply-To: <20241029203014.399-1-bavishimithil@gmail.com>
References: <20240626095056.12607-1-bavishimithil@gmail.com>
	<20241029203014.399-1-bavishimithil@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Mithil,

Am Tue, 29 Oct 2024 20:30:14 +0000
schrieb MightyM17 <bavishimithil@gmail.com>:

> > Well, no, the file is not used at the moment, I do not think it
> > makes sense to have it in without an actual in-tree user.  
> 
> So, I am planning to merge espresso dts
> (https://gitlab.postmarketos.org/postmarketOS/pmaports/-/blob/master/device/community/linux-postmarketos-omap/0002-arm-dts-Add-common-dtsi-for-espresso.patch?ref_type=heads)
> once this gets merged, plus it can be later used on epson-embt2ws as
> well.
> 
well, lets merge the stuff together with a dts as an actual user, so
submit a full patch set with
- binding patch for board compatible
- dtsi files
- at least one dts file

having a short look at the patch you linked, you still have some
underscores in node names.

Regards,
Andreas


