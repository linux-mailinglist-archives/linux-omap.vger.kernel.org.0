Return-Path: <linux-omap+bounces-2717-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 275F69D4C63
	for <lists+linux-omap@lfdr.de>; Thu, 21 Nov 2024 12:57:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B94F4B25F04
	for <lists+linux-omap@lfdr.de>; Thu, 21 Nov 2024 11:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE32F1D5ADC;
	Thu, 21 Nov 2024 11:56:50 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from sender-of-o57.zoho.eu (sender-of-o57.zoho.eu [136.143.169.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9119A1D47A0
	for <linux-omap@vger.kernel.org>; Thu, 21 Nov 2024 11:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732190210; cv=pass; b=dvk4apQFGYAB6r9IP9unEgkQTqtULNZ/lsxFHG+/sjLus0mxn4pc0xRnbqo0GPO81aO6H9FPG0GWZWb6USLqxx3ktulJ8CuGIKcKtu0y+whnQ9xpBi7YuPSJXZjOv5n4EYOs8ohVXuqh95TYOwpOL3R1e1UbSBMvebo9aFroeEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732190210; c=relaxed/simple;
	bh=w1+Vj1dIkmLMXOY2n2Lm0v77fGsaIIvIuQPKDdfIDOw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qUOHjOUDUVVb1FiQvRSmynd1q8+lDV5n4N2RxJ3uOALDRLeDHH7ykkjYDiCJ2o3guhKh48kPi800K+N5wvQ4KgAt3lUu5a6FkfVKIiWNbs0yVSwSPIwyHTasaouqZ6tfkropeAOPQVoyzN4Z0lNqGuIvZTCJ+rxCsd8qFIi6+FE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uvos.xyz; spf=pass smtp.mailfrom=uvos.xyz; arc=pass smtp.client-ip=136.143.169.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uvos.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uvos.xyz
ARC-Seal: i=1; a=rsa-sha256; t=1732189269; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=TUKJA0p2dO+QehMG4BdnenUH9iWIaKCyZt56b9+8AQuFZX8YZLKy+cCgx1vcDVXTHNnzp/DI+kL1E7TaBnjQJBuXVa4Qf2hYKcPie1k8N2Vx7pCTBsQi6EoZs2+AT6MZDyiuyieGvl/Qj1jiXVeGPgbaicE9sVgl2XB+yuE5DlM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1732189269; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=w1+Vj1dIkmLMXOY2n2Lm0v77fGsaIIvIuQPKDdfIDOw=; 
	b=diL/oFnLM/igm3IL9iACVpTm5/7oDo6b2X7k2bolmYR9GY3GJvjULHYdS87arf7zv+ZWB/W5BkU6wx+xzDtgoDCLplxpX4FcpxCH0rU3xxEOQF1UTmXoPsvQ2rxdw24EjIjyIG2/Bk3jXmeopvz8yLVu3qX2NIwVTFTp0Bg58Y0=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	spf=pass  smtp.mailfrom=devnull@uvos.xyz;
	dmarc=pass header.from=<devnull@uvos.xyz>
Received: by mx.zoho.eu with SMTPS id 173218923820461.772127192647986;
	Thu, 21 Nov 2024 12:40:38 +0100 (CET)
Message-ID: <1aa03cb201857f70bc46143a16465f0a08870401.camel@uvos.xyz>
Subject: Re: [PATCH] media: staging: drop omap4iss
From: Unknown <devnull@uvos.xyz>
To: Andreas Kemnade <andreas@kemnade.info>, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>, linux-omap@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Linux Media Mailing List
	 <linux-media@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Thu, 21 Nov 2024 12:40:37 +0100
In-Reply-To: <20241120085406.4d864c6e@akair>
References: <815a789d-85a5-44a1-8b9c-429ac0101e3f@xs4all.nl>
	 <20241118200025.3daab676@akair>
	 <20241119070222.GX31681@pendragon.ideasonboard.com>
	 <20241120085406.4d864c6e@akair>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External


Hi,

> BT200 has a camera without mainline sensor driver.
> Droid4 has also a camera. What is the status of the sensor driver?
> What about the samsung-espresso tablets? And the xyboards?

Same as your device droid4 and xyboard handle the camera via m3
firmware.
The droid 4's rear camera is totaly unkown with no datasheed or open
source driver known to exist.
The front camera has avaialble datasheed and out of tree driver.
The xyboards cary the same sensor as the d4's rear module.

We (maemo leste, a distro that has put considerable effort into
bringing up the droid 4, droid bionic and xyboard) do hope to
eventually bring up the front camera on the droid, as all the
componants for this are floating around, but are currenly not working
on this issue.

regards,
Carl

