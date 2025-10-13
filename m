Return-Path: <linux-omap+bounces-4677-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D76BD3A95
	for <lists+linux-omap@lfdr.de>; Mon, 13 Oct 2025 16:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFAC6189FCB0
	for <lists+linux-omap@lfdr.de>; Mon, 13 Oct 2025 14:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0AF3081CD;
	Mon, 13 Oct 2025 14:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="g0TgIGJa"
X-Original-To: linux-omap@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E403A3081A7;
	Mon, 13 Oct 2025 14:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760366671; cv=none; b=FF1do2aNaovoHtXU7dyW3eNG5A4y2Mlxea/TtVnbD38mswgRS7t0lJ7XVYGhuFKEELxtLRF11aQjpU/gzyTu1oldrzZuypxCYZNNN5xM8r4KQyOwRS0zOOTtCD4Ye04zrOntcVUbq3tId78pnq7yTKoyRvRZuksiIkqKoEhGTjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760366671; c=relaxed/simple;
	bh=70aD+3Tiht88D8owOdTgFkVMX1UdGuo6spJcDNv9RwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQDPQNUE39KQyBpqkXFZDZacRd0O4bmhdGTbUEeMto+QWaN4/WynP9+DH7jl/U4Okev1BsB16ZwaoIp/H20i8KSckfobahnobS08pwvcUDN7Ru7/VEEp93masBRoH6XL5BcmVmCMArq60KDSwW4BT0M2iNzfDa62OSJgIxH3Dyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=g0TgIGJa; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=G+VQB+hiJPh92th3qbheV1XTyYyn2xhM8wRB+hyGEMg=; b=g0TgIGJasgCmkUxU1HDouzoFlJ
	McSBBwEPiI5tbRS/EjlU3YGJPJosS1UkbDmQ9fFG0i8txHbWTUZ7avsUzfmRmg3LIY9b7vc6yC9mx
	PcgRFkpXsnwLJtSFBFwPxoU3Y28iLmVfOQ5YZqg3tlUM71WFJKFKHM8JGFhd5+hvo3FA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v8Jma-00AnPy-Og; Mon, 13 Oct 2025 16:44:16 +0200
Date: Mon, 13 Oct 2025 16:44:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Parvathi Pudi <parvathi@couthit.com>
Cc: tony@atomide.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, richardcochran@gmail.com,
	linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	danishanwar@ti.com, pratheesh@ti.com, prajith@ti.com,
	vigneshr@ti.com, praneeth@ti.com, srk@ti.com, rogerq@ti.com,
	krishna@couthit.com, mohan@couthit.com, pmohan@couthit.com,
	basharath@couthit.com, "Andrew F . Davis" <afd@ti.com>,
	Murali Karicheri <m-karicheri2@ti.com>
Subject: Re: [PATCH 1/2] arm: dts: ti: Adds device tree nodes for PRU Cores,
 IEP and eCAP modules of PRU-ICSS2 Instance.
Message-ID: <8cfc5ece-6c2e-48d9-a65c-3edbcc9edc39@lunn.ch>
References: <20251013125401.1435486-1-parvathi@couthit.com>
 <20251013125401.1435486-2-parvathi@couthit.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013125401.1435486-2-parvathi@couthit.com>

> +				interrupt-names = "rx", "emac_ptp_tx",
> +								"hsr_ptp_tx";

Something looks wrong with the indentation here. The same happens in
at least one other place.

> +&pruss2_mdio {
> +	status = "okay";
> +	pruss2_eth0_phy: ethernet-phy@0 {
> +		reg = <0>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <30 IRQ_TYPE_EDGE_FALLING>;
> +	};
> +
> +	pruss2_eth1_phy: ethernet-phy@1 {
> +		reg = <1>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <31 IRQ_TYPE_EDGE_FALLING>;
> +	};


PHY interrupts are 99% level, not edge, because they represent an
interrupt controller in the PHY, and you need to clear all the
interrupts in the controller before it deasserts the interrupt pin.

    Andrew

---
pw-bot: cr

