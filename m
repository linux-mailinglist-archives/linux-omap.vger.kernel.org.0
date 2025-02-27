Return-Path: <linux-omap+bounces-3306-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5272A47F1D
	for <lists+linux-omap@lfdr.de>; Thu, 27 Feb 2025 14:28:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB9E1172F76
	for <lists+linux-omap@lfdr.de>; Thu, 27 Feb 2025 13:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF7922FDF7;
	Thu, 27 Feb 2025 13:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="QiDdSC9p"
X-Original-To: linux-omap@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120DB22FF3A;
	Thu, 27 Feb 2025 13:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740662675; cv=none; b=cfJbo8FhwRNpYSL01DqsrT14w/MeatAIQy6i0wqXXadZheuEHCur0gZYfaHqPnGk2qIWjd7WOf9QkgUekvzpvK38RhTaybhivfl2phhLjWZOS6H3lCyJyfrSezjC32AA/q0J1iJT38LS5cui9SBfVJ8AAslc4+qoJquUkAjJmd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740662675; c=relaxed/simple;
	bh=689QMO2WQrwhsiJ/MmVlKcY00dnC+JoByq9afi7R7Uk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AehrNIrny59iqnDCTKwcmuCd0VsE4Lp80EyWMT2dXy4Y2mC1LLRw4P16agA91hs2Ckj+rj7SBuP8pTJ0w0W6XQgcH9+eY+A6Ya5IjDTbVta2pRmiNiZbx+QpSFwPHKck2enbmmoq+TnQxsoq+bKYeqsmoRa6C+jSuuDUUQGnry8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=QiDdSC9p; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8BSqWmq2gHXZy/UK7PHrlCcTARwZIn77OkGnoxC+OOI=; b=QiDdSC9payjBtRYfN2vE0Ih7v7
	ulk1ZIkN3W762yz2yATE+EvxrOwPhLKfVmfWaz71TIcrXk/vGITdytgsFmRnzpkzMhDMpbR0hND6l
	5TwxLNwcOo48XZB7Cu9r4P53KqJGER+eiIdIUSyASUIipTTFsV460mBK6/fTMY70dlRQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tndsC-000bAJ-Fe; Thu, 27 Feb 2025 14:24:20 +0100
Date: Thu, 27 Feb 2025 14:24:20 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>, netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: ethernet: ti: cpsw_new: populate netdev
 of_node
Message-ID: <2f6bc566-4903-4509-83c2-196e82378eca@lunn.ch>
References: <20250227074704.4067481-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227074704.4067481-1-alexander.sverdlin@siemens.com>

On Thu, Feb 27, 2025 at 08:46:46AM +0100, A. Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> So that of_find_net_device_by_node() can find cpsw-nuss ports and other DSA
> switches can be stacked downstream. Tested in conjunction with KSZ8873.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Consistent with other TI drivers. But it looks like only TI drivers
need this, which suggests they are all doing something wrong, maybe
for legacy reasons.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

