Return-Path: <linux-omap+bounces-2836-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 868EB9F4F8E
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 16:35:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF35E163701
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 15:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08AE71F755A;
	Tue, 17 Dec 2024 15:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="ySobKkmo"
X-Original-To: linux-omap@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47389EAC6;
	Tue, 17 Dec 2024 15:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734449738; cv=none; b=I0WEACB/w5PykSyEg2T7GGnhCDhnv7BsyBHIpRViLn9eqQnnpVcLHrqvpvRH6uBIX/aC2CPgjNJwnx93AYR1wDSZ/jqp4HU+O460QCjq2EOaQtGTsb7GmuFUJceJDuqkR5cL+gATRiRJHNarUGgAGqBg6cJ3d509AygxXaGLZ6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734449738; c=relaxed/simple;
	bh=1tdqeGsFmdHNAI6f39ONvPeEUyfkHgn6nA/KOeVxMgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ByoPhBev7QxXUyJDgzmwv/5tEXTFoKMi/Vspv9XiTfQRaaaTxt4Kb6S3Mtx74OsMQITEgmXzFU0XC5gAq46dWdUKfiQbJ4HpwP9n552EZcq5FelOI/zz+CcNDYSVXdTV9pGy9mVBxnPUXw5AIIXXhHFwo0N0B5k/ErBDTD7CV4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=ySobKkmo; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=3Va9FT6Zm8diLy1g5Ee5uh/4gUxg81QV8kpRvkYFt+c=; b=ySobKkmoZCRR0BpnTGZO/VuPHJ
	5v53ql6euasM5l0zkRtn1g5DgoT+Mo/wbsppSCix11mYy2fA4pCLkb6G2fJKTHqQHLzMNt5u+C7hQ
	iJ7zUZpdB8J5hc4zKhHWltlfamq/8QN4T41+cB23yrUWiRflVK95NMdS8SjOr9vGiurw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tNZbj-000zWl-8C; Tue, 17 Dec 2024 16:35:35 +0100
Date: Tue, 17 Dec 2024 16:35:35 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Da Shi Cao <dscao999@hotmail.com>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: TI Ethernet Driver TI_K3_AM65_CPSW_NUSS
Message-ID: <417fd70e-e44d-4122-ae36-14e550e89a64@lunn.ch>
References: <CY5PR10MB59880DDECD5D282B7665085B8C042@CY5PR10MB5988.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY5PR10MB59880DDECD5D282B7665085B8C042@CY5PR10MB5988.namprd10.prod.outlook.com>

On Tue, Dec 17, 2024 at 01:40:12PM +0000, Da Shi Cao wrote:
> The driver of TI K3 ethernet port depends on PAGE_POOL configuration option. There should be a select PAGE_POOL under it configuration.

Please wrap the commit message to around 75 characters.

Please take a read of:

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

You need a Fixes: tag, please use the correct networking tree, etc.

	Andrew

