Return-Path: <linux-omap+bounces-2761-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0C29E159C
	for <lists+linux-omap@lfdr.de>; Tue,  3 Dec 2024 09:26:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A2672836DB
	for <lists+linux-omap@lfdr.de>; Tue,  3 Dec 2024 08:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC091D279F;
	Tue,  3 Dec 2024 08:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="fRpGUxc9";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="mVDS3y3M"
X-Original-To: linux-omap@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12AB1BF37;
	Tue,  3 Dec 2024 08:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733214375; cv=pass; b=rrebHcT5BgcoFSQz+i7kQRNGviBYfSQfKHXgLHzZ+2NhctBGhdVN+hygor1p5GWFctXEalpTC3jcqvaw1lyDf+y0nvJV5wR7on2dHSxizYj8KnJR/N97esT7gQgJvlxhBihm+/HGb/4znB6RA/GazeEVDVPzrF7eroCqzbJgCsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733214375; c=relaxed/simple;
	bh=7vN8l4edstpV5RzHSdRN5fx4Jcl4tlzQ0oQDgnVYIaw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=jmrWJAPp16t1J1oC7DEo9fVhQBmbJqxqc8Gw2GO24/hfSZiD0XgaNpYS4KE5CPcRItFXShgHR03P2khzYmhu/I4uoCxtjrdwf7s8Oo4FXXkW2ltPtLhYtNBmIme6oX8vCYsooCmyViuqRgnTmawvKsYTVQR80jvtr4rEwjVzU5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=fRpGUxc9; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=mVDS3y3M; arc=pass smtp.client-ip=85.215.255.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1733214355; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=DGkPLkUVduoNlvgnBhAd/xOGpZ+IX/8+KPn9k5d6u5V/Rs3m6wWLS622SWd9Cq7Mg9
    M3OLps/p4A/8mYcm2gP6s4G/rpHbV2XqTr3KEb8MLVLfn3aGDsrobYtLOc797z49wGRd
    k0G4dVJ9udrFcgF20cAY8TsAfCthETJCUbcCjYv5L8UaTMmOSWWFoLfT60Uj263kdQbe
    EjycmRKRYpzAoNOTDb+bw930vR3YZD+PsEvx35UFTtvYytXq9Mk7qtMIZcVa9AtLcnwB
    6BoRGHgtDS7O/FdfXOw7vSZkr74F8jiDOVUOwzn3FxYiq06tvrd2vRf+FuRdtYfNKJBL
    g09A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1733214355;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=DCa5qKli0andoxvIvdZequyVK0KYQyS17ykqq5CaiJk=;
    b=tHhYf2YAxjA5zWUVTzYu4yo8vOGRlRQ0+VcGHJrkJTVTqjaGTbdnebD/gT8sZTgRHk
    9RDCiGOzWFhvfGNMhHBc5q3WARkxeBCPcrriwZq66pBjeW9QAL2AgUSCMiW4KlRYMo4U
    6QvkKUx2Yb+EGOhOM7zL4nWDfnmJJd5JGFJyeQuFD1/s1rn7AVNMHTL0GXzlhrb1wx7B
    7ILqXCvfk+550xFd+BFdt4vsh6e8qH7/nfTDGe3n/QPoOBuOv7zEqharv6N54ywcBR7R
    epZEzuxRZSZJw8wDfDEhIDmoJCx7+NdaWfGcOZO8XNHHZ4FSHvHACbeRY6Qf8k4EGO2R
    angw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1733214355;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=DCa5qKli0andoxvIvdZequyVK0KYQyS17ykqq5CaiJk=;
    b=fRpGUxc9RCoN1tAwl3lhMgEZ4ET7zrCSFBVGi7ikcsDlclKDsNknCbtqpZyPndInxI
    rZXXAI0LCq7NZ0u9kYm/ByDiWxf+HcwxsKOKHNYYib8dB8q6Ccgd5yOoR3YUdr7itQrm
    hwwaMl6jyRdJ7VHYVBcGHBThPoF03lUdNZQgyDN5atAg7nUzWzoIO/iHwSVonh9fMCqs
    IOerpyM+MRP6zuDR4+mmLLd22FXnp7L4OLbiZZcdR8z8uqXK58bEKIpwLGwTO6J5HNk1
    +1wWoeUeEONU6//YONEf9aZgTIeJblyuA5KRIFd0GBWYVOatVwBkKuhBqXAN7Uubcrgx
    wqAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1733214355;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=DCa5qKli0andoxvIvdZequyVK0KYQyS17ykqq5CaiJk=;
    b=mVDS3y3MVpOoPFvrl+NCYTncEhHVlv0IwKtVaLV+/RM44oVHfBKu/40/vl04evfs86
    GrZiFlQTYuS7SPxQ1UBw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrT25oMmciNwTZVQsFwoTCsf66pt09L8Xu393o="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.11 AUTH)
    with ESMTPSA id Qb7e400B38PsmqP
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Tue, 3 Dec 2024 09:25:54 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [PATCH v2] i2c: omap: Cleaned up coding style and parameters
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <Z06zxM3pREgrOvQA@melbuntu>
Date: Tue, 3 Dec 2024 09:25:43 +0100
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
 "Raghavendra, Vignesh" <vigneshr@ti.com>,
 andi.shyti@kernel.org,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 tony Lindgren <tony@atomide.com>,
 Andreas Kemnade <andreas@kemnade.info>,
 Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <7B167CB3-EC8E-41C6-8A91-123167579475@goldelico.com>
References: <Z04CA8fGCC-nyZIY@melbuntu>
 <Z04faeJUgZTydiMb@darkstar.musicnaut.iki.fi> <Z06zxM3pREgrOvQA@melbuntu>
To: Dhruv Menon <dhruvmenon1104@gmail.com>
X-Mailer: Apple Mail (2.3776.700.51.11.1)

Just a minor nit:

> Am 03.12.2024 um 08:31 schrieb Dhruv Menon <dhruvmenon1104@gmail.com>:
> 
> Hello Aaro, 
> 
> I have updated the patch as requiested, splitting it two parts,
> 
> 1. [PATCH v2 1/2] i2c: omap: Cleaned up coding style
> 2. [PATCH v2 2/2] i2c: omap: Removed unsed parameter

use "this patch will do" point of view, not "I have done"

=> Cleaned -> Clean

And there is a typo in "unsed".

> 
> I have also removed the changes regarding msleep as the adjustment
> was relatively minor. The change was initially considered based 
> on "Timer's howto" documentation which recommends to change any
> msleep(x) < 10ms to usleep_range(x*1000, x*2000) for better 
> precision.
> 
> Thank you for the time and review. I look forward to your feedback
> 
> Regards
> Dhruv Menon
> 


