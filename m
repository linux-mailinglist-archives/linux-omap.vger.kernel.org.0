Return-Path: <linux-omap+bounces-3563-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5107A82385
	for <lists+linux-omap@lfdr.de>; Wed,  9 Apr 2025 13:27:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00BE517FEF1
	for <lists+linux-omap@lfdr.de>; Wed,  9 Apr 2025 11:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E337A25DCFB;
	Wed,  9 Apr 2025 11:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="EZiTOGN5"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B9625D556;
	Wed,  9 Apr 2025 11:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744198021; cv=none; b=EPo7bj9dK9CnCbGD1owJMpbm4fK1Y5+5rV2ClksmUc5X1IAuQEK1AY6CJNUZ+XFGG8ufsBOJT/w43cMf2N2BJmNgaGdEFsNTL+aFs4Zd39/pFQ/aw0zONCo5/opBaYsY/sQJNttDuHh9ssDvY6Raf1LHpyY05IwSiyOH3qvC7N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744198021; c=relaxed/simple;
	bh=d5BtOjPPRFG910sk+qDsz+sS/QMq62FGUCQDk6Lox74=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=g5mlZ71ZLVUnX0XPKnQYQsGi7p7wvcK+fY7W/U3duuGM1CnmEqmCmQrBymSxPBqWypmhO2zZ9zzJMoH7Ok2Rru89pAog/RcciF4O7DbwCgcAPeD5F2QSbOWRyu5HB7d+ZE6ksHVzsngApXdYdQYr6IPvydHbKl86YW5/18kXJl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=EZiTOGN5; arc=none smtp.client-ip=162.240.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=A8OUMSsqyLIihlV/s3RjCMqd4+HGdZT4D0Danegj940=; b=EZiTOGN5QQPVhS/G4Z4pNruK7K
	Lfv9vKeuYOP1u1erh9WoRg7nI1cSIKzxsHkncbTo8oKfM7F2pMbuG4ZTcgRRkQ8vx4BZcni338eCh
	XIKPyYQeTfJ3aMPeDWr1JPZP9OehXPDOD5S3mTp9mYMalDEZwAGo9WBoBEDLjNi4LHK9q0BItJ70S
	cJupGhxCNYFmNmk5ZLNovJABpuWcqmUiBWQdt9ldIGqiVfvEHqHyG1V+G//RoO9XaC/+8qDju3hHf
	RAIwH/K/T4gzv6ZTwAwnljEsCfjbyKN9Sw6TRs0dS48JFmBtQaC+esYd7hKOjPMiQLUkod+2KGGh4
	olE+CtdA==;
Received: from [122.175.9.182] (port=6319 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1u2Ta2-000000000OO-3638;
	Wed, 09 Apr 2025 16:56:54 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id C2069178207F;
	Wed,  9 Apr 2025 16:56:46 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 9F487178245B;
	Wed,  9 Apr 2025 16:56:46 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id emKaGm-byJBY; Wed,  9 Apr 2025 16:56:46 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 52C58178207F;
	Wed,  9 Apr 2025 16:56:46 +0530 (IST)
Date: Wed, 9 Apr 2025 16:56:46 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: parvathi <parvathi@couthit.com>, danishanwar <danishanwar@ti.com>, 
	rogerq <rogerq@kernel.org>, andrew+netdev <andrew+netdev@lunn.ch>, 
	davem <davem@davemloft.net>, edumazet <edumazet@google.com>, 
	kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, 
	robh <robh@kernel.org>, krzk+dt <krzk+dt@kernel.org>, 
	conor+dt <conor+dt@kernel.org>, nm <nm@ti.com>, 
	ssantosh <ssantosh@kernel.org>, tony <tony@atomide.com>, 
	richardcochran <richardcochran@gmail.com>, 
	glaroque <glaroque@baylibre.com>, schnelle <schnelle@linux.ibm.com>, 
	m-karicheri2 <m-karicheri2@ti.com>, rdunlap <rdunlap@infradead.org>, 
	diogo ivo <diogo.ivo@siemens.com>, basharath <basharath@couthit.com>, 
	horms <horms@kernel.org>, jacob e keller <jacob.e.keller@intel.com>, 
	m-malladi <m-malladi@ti.com>, 
	javier carrasco cruz <javier.carrasco.cruz@gmail.com>, 
	afd <afd@ti.com>, s-anna <s-anna@ti.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	netdev <netdev@vger.kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-omap <linux-omap@vger.kernel.org>, 
	pratheesh <pratheesh@ti.com>, Prajith Jayarajan <prajith@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, 
	srk <srk@ti.com>, rogerq <rogerq@ti.com>, 
	krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>, 
	mohan <mohan@couthit.com>
Message-ID: <890030824.1024606.1744198006152.JavaMail.zimbra@couthit.local>
In-Reply-To: <64a3cd3b-feee-4414-8569-01642b127ac8@lunn.ch>
References: <20250407102528.1048589-1-parvathi@couthit.com> <20250407113714.1050076-6-parvathi@couthit.com> <64a3cd3b-feee-4414-8569-01642b127ac8@lunn.ch>
Subject: Re: [PATCH net-next v4 05/11] net: ti: prueth: Adds ethtool support
 for ICSSM PRUETH Driver
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds ethtool support for ICSSM PRUETH Driver
Thread-Index: Id9woddb5lTowb7DJcpLv93q8Zy6wA==
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.wki.vra.mybluehostin.me
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hi,

>> +#define PRUETH_MODULE_VERSION "0.2"
> 
>> +static void icssm_emac_get_drvinfo(struct net_device *ndev,
>> +				   struct ethtool_drvinfo *info)
>> +{
>> +	strscpy(info->driver, PRUETH_MODULE_DESCRIPTION, sizeof(info->driver));
>> +	strscpy(info->version, PRUETH_MODULE_VERSION, sizeof(info->version));
> 
> Driver version numbers are pointless, they never change, but the
> kernel is changing all the time. Leave version blank, and the core
> will fill in the kernel version, which is useful.
> 

Understood. We will address this in the next version.


Thanks and Regards,
Parvathi.


