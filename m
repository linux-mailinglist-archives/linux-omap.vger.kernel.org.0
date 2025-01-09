Return-Path: <linux-omap+bounces-3053-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00494A078BC
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 15:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DC921661FF
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 14:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA825219EAD;
	Thu,  9 Jan 2025 14:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="vKnDRRcF"
X-Original-To: linux-omap@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFF921764D;
	Thu,  9 Jan 2025 14:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736431913; cv=none; b=ef+XEx0ADicpWptIZW+ZHOeLGcKRAivJwQICevxOayUE9AQDl3jHIBGCx9j3NmohuK4xAA5PulL0mM9mOau5jgERYmPtI9mGOQWUU7QuvNNj+g5+TItbB3reGqfTu2IqDwR0C0yl/iXGZgJ5giklv++m0qDCeWF2sAzEkeDmPJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736431913; c=relaxed/simple;
	bh=/oLYBdeqAYZ93lQ4dBkYr/2nv+qCGKWjw4hYhSEUm+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FRw0sT2k1t6qyH9rz93od0gK2Vxc1wNSaakHqoxxXAqKHZYrvkaLpr1aCEItCndg52YQ/1ya21lGRi2huWuwHcCvNbjELLrolQoUDf9k8+0Owjc6vmWIoKTll+mRNm0qCXV7XB3GbHapwU3KVZc9qqUJSyMnqpP09UEr0h0Lopk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=vKnDRRcF; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=vNh7DueZ0ROhGXSoVao0r4XYvV32aPWQzqAogsGA9pE=; b=vKnDRRcF0Gff8rhBV3+joaGp0z
	QB/FUdZLbjzRvbvftL0QBE9Jed2l6xIG4FfwIpMGgxT0s0ux9rgALc94CQDJhXzJt+ZjgF0VuAI8k
	QUBxaqp2Q72CTK3UXbTpS56Xut3Jy2W9sUADpgrbMJm0TenBa2Z0nXgwLnuyshETkN1I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tVtG1-002uSH-NK; Thu, 09 Jan 2025 15:11:33 +0100
Date: Thu, 9 Jan 2025 15:11:33 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Basharath Hussain Khaja <basharath@couthit.com>
Cc: danishanwar@ti.com, rogerq@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org,
	tony@atomide.com, richardcochran@gmail.com, parvathi@couthit.com,
	schnelle@linux.ibm.com, rdunlap@infradead.org,
	diogo.ivo@siemens.com, m-karicheri2@ti.com, horms@kernel.org,
	jacob.e.keller@intel.com, m-malladi@ti.com,
	javier.carrasco.cruz@gmail.com, afd@ti.com, s-anna@ti.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, pratheesh@ti.com, prajith@ti.com,
	vigneshr@ti.com, praneeth@ti.com, srk@ti.com, rogerq@ti.com,
	krishna@couthit.com, pmohan@couthit.com, mohan@couthit.com
Subject: Re: [RFC PATCH 00/10] PRU-ICSSM Ethernet Driver
Message-ID: <2e82fb20-c6f9-4cc3-a700-fce049295f58@lunn.ch>
References: <20250109105600.41297-1-basharath@couthit.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109105600.41297-1-basharath@couthit.com>

On Thu, Jan 09, 2025 at 04:25:50PM +0530, Basharath Hussain Khaja wrote:
> Hi,
> 
> The Programmable Real-Time Unit Industrial Communication Sub-system (PRU-ICSS)
> is available on the TI SOCs in two flavors: Gigabit ICSS (ICSSG) and the older
> Megabit ICSS (ICSSM).
> 
> Support for ICSSG Dual-EMAC mode has already been mainlined [1] and the
> fundamental components/drivers such as PRUSS driver, Remoteproc driver,
> PRU-ICSS INTC, and PRU-ICSS IEP drivers are already available in the mainline
> Linux kernel. The current RFC patch series builds on top of these components
> and introduces changes to support the Dual-EMAC mode on ICSSM, especially on
> the TI AM57xx devices.
 
I guess this version also has the horrible architecture of multiple
firmware's you need to swap between at runtime?

	Andrew

