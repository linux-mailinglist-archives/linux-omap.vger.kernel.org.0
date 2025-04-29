Return-Path: <linux-omap+bounces-3620-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2028AA0B1A
	for <lists+linux-omap@lfdr.de>; Tue, 29 Apr 2025 14:07:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72D0716DADA
	for <lists+linux-omap@lfdr.de>; Tue, 29 Apr 2025 12:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D06812C2562;
	Tue, 29 Apr 2025 12:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="EEv2Mv/P"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C7B278E42;
	Tue, 29 Apr 2025 12:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745928274; cv=none; b=oZYEap0+JvuNF8AalMqeplkMgf9vZm+NsZhAVGJ7FMiIR+XrsQq7lyIAD5JcVvRmfzY/vLq6wkPCw5X1mVFtYdLEyQGPU8sKaRe/ZJmPUp5GT/2qXchwUIcaaxRr0bzSVcweVPh3A3PqYbJZKh2b8nvyQkCbfyEYl3Kf4RXj2so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745928274; c=relaxed/simple;
	bh=SYZGUFB6gTksaf0IctxnHNRt3T8zrdNfeOJ9LD98xCk=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=qp90zX8QNO9CijoQC9r0rhr+GI+hGYOGI5LZO1MESxFtCMoYjvZNioZxxUpbe1vFpmxSpSjPwuvkBSfr9PRWkByFiGkaDgWejse9toMVs/XA/x3I7ls64U1DbhkbG974LTty9JtgaEivQBKq4++C/7MVVi3/8SDdEWlL7cC4nWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=EEv2Mv/P; arc=none smtp.client-ip=162.240.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=bLLRKKNEb4/XcmmMXZV9Rmx8EwSf4W/vH2m5oybaYu4=; b=EEv2Mv/PNUvNJvRop4MP+1Z9Lr
	0HXtWvF6pBUSqrEw1bJjNL3NptjUU9BXpMPbxwlKO4yJl2bIO0v7LIEzJ2HoDtIlJwZOlNuoCZRT1
	a1nBMtsdC8myXCCgg2vpYMor5r3/sgCuR713V+F63Xqe43Q6HxrhyMHiqb0hoF8I3TioTy4unDAUJ
	wprFA+/XoQVlzmm+GgfznjU5Uyd1mYvvcpUBXPpXCMK3oc0ThfrR9N7PMWrE5Z02Tfouh1lOFEcR5
	g9hYxmyHNr/qYi0iXrsvvVOYIWJbQLQbc2R5UXxaa9VBA04Qin9WI7CJKCsCDC2KQLqGLV+gX3nO7
	tenpWBpQ==;
Received: from [122.175.9.182] (port=43062 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1u9jhM-000000001xh-3nb9;
	Tue, 29 Apr 2025 17:34:29 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 06ABE1782431;
	Tue, 29 Apr 2025 17:34:24 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id D9F6D178245B;
	Tue, 29 Apr 2025 17:34:23 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id mMPoJOb4M3MP; Tue, 29 Apr 2025 17:34:23 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 9D4261782431;
	Tue, 29 Apr 2025 17:34:23 +0530 (IST)
Date: Tue, 29 Apr 2025 17:34:23 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: andreas <andreas@kemnade.info>
Cc: aaro koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, 
	parvathi <parvathi@couthit.com>, rogerq <rogerq@kernel.org>, 
	tony <tony@atomide.com>, linux-omap <linux-omap@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, nm <nm@ti.com>, 
	pratheesh <pratheesh@ti.com>, Prajith Jayarajan <prajith@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	danishanwar <danishanwar@ti.com>, praneeth <praneeth@ti.com>, 
	srk <srk@ti.com>, rogerq <rogerq@ti.com>, afd <afd@ti.com>, 
	krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>, 
	mohan <mohan@couthit.com>, basharath <basharath@couthit.com>
Message-ID: <1444286613.1173468.1745928263383.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250426115424.518cfe88@akair>
References: <20250407072134.1044797-1-parvathi@couthit.com> <20250407072134.1044797-2-parvathi@couthit.com> <20250426115424.518cfe88@akair>
Subject: Re: [PATCH v1 1/1] bus: ti-sysc: PRUSS OCP configuration
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: ti-sysc: PRUSS OCP configuration
Thread-Index: 9Ms9CBUzLFE0VAoHkNawnh3q8eMBNg==
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
> Am Mon,  7 Apr 2025 12:51:34 +0530
> schrieb Parvathi Pudi <parvathi@couthit.com>:
> 
>> Updates OCP master port configuration to enable memory access outside
>> of the PRU-ICSS subsystem.
>> 
>> This set of changes configures PRUSS_SYSCFG.STANDBY_INIT bit to enable
>> the OCP master ports during resume sequence and disables the OCP master
>> ports during suspend sequence (applicable only on SoCs using OCP
>> interconnect like the OMAP family).
>> 
>> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> 
> mirrors what is done on module disable, so it looks sane.
> 

Yes.

> Reviewed-by: Andreas Kemnade <andreas@kemnade.info>

Thanks for review.


Thanks and Regards,
Parvathi.

