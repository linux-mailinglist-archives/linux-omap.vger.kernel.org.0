Return-Path: <linux-omap+bounces-3037-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF9AA0698C
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 00:37:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 090AB1881BA1
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jan 2025 23:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E37220469D;
	Wed,  8 Jan 2025 23:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="BO6Fhz2T"
X-Original-To: linux-omap@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587D4204096
	for <linux-omap@vger.kernel.org>; Wed,  8 Jan 2025 23:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736379430; cv=none; b=EVNrUIGzvks7RGY1/UyHjLp4Xyn/kuWRtGmlo6FFhuAadxNsDpYqGAfMcuByC1dZo8+xFU3yyPcD3cLtfYUQdkWchtyH0VQp8SMMGj3iYwm4W1QdB4+Wo++JumrPEKq31Z1DtHWqIHE//LgbN+tnBx4aq7nSI9OJgugpj/KmHqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736379430; c=relaxed/simple;
	bh=os7sY/UoftvK8Qc3BP3QYU7V2uC3egzD0pa1X0ExH2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ClZcSSSpniR4Xw5FKqKhxk9ro5NBmNCACwYjpggnyx25VJLBmf5fEbx8/TXKuNv0vbBHVqcswXBgOnl3vyQMhhkUyuxSx+Dq2uz+CQC6dKwt5HlqxmDRejIr8wCfkw0YN5UhxQxg9LoFCBavSUvrswMW8VmKKXim4sj5CZwYN/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=BO6Fhz2T; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1736379407; x=1736984207; i=deller@gmx.de;
	bh=Gqqo6hqm8zE/R+T3V3Miyfags4lsiG8b124XrSpazbc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=BO6Fhz2TE/bnKI5Ds+DM/dQI5Tcac/KF4NnIzRmiJGGQITey5G0COtZiuVQjqeeF
	 Xh7YZ10gX3SLydaevjPtJUiBaaDHXEn+8/x9y5K+vAoYBv2RWpFpapC5QfSPERA37
	 O9ZxzeHhIa1WNEV7yI6IcJY4/D4iAx7eNBVy7Vz/c+qaqelXifbd6i9kPz5cx6qIb
	 qSXit1iCgpIiBkET31+lsqbCMwpCf3SRUI3AVtYBgFhKABzo2Oaf5FddtPAnjz3o8
	 +FVI0/lmvjhJrHiqdOko6oglcV513Xp3SInCxNG8P+irYa4kHGCPBOElJk/HqdtBH
	 evKUs1mi4vx/av7aXw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([83.135.220.169]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M7b6b-1tNhWE1e29-00Ca2G; Thu, 09
 Jan 2025 00:36:47 +0100
Message-ID: <6ff86d7b-5128-400b-ade7-f54a86864507@gmx.de>
Date: Thu, 9 Jan 2025 00:36:47 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: omapfb: Fix an OF node leak in
 dss_of_port_get_parent_device()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: kuninori.morimoto.gx@renesas.com, elfring@users.sourceforge.net,
 linux-omap@vger.kernel.org
References: <20250108011537.2748127-1-joe@pf.is.s.u-tokyo.ac.jp>
 <20250108230336.GI32541@pendragon.ideasonboard.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250108230336.GI32541@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iAh2xHt6rGPZh1/qFMTHZ/iX02s3oAegfkITL0schg8rzyOHZqe
 XH9KWKontZTB7iILOtM6eRcNxE4ymhJyqP1e4ZMNMeX283AS0F5LppT013Ha0Lm4KiPhhyW
 NyILDSwhtBuwKFf65yEvDMcjlSNjM3GAd+7oIaCW6xybKNsV1sT85nVmvNtbTDIMPvdD8vs
 W6tbidH7hohHYdXf6IiHw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DEHb/if4gAs=;xV2VYNE5XAQAsSKwyYrZ/2qGLSS
 jYu6R4+lmwIZr6PHwtXV0JOfLkbXz/1htngmjruAHJMHuKTSn9EZHYKbjd0/I3669QCAoezFI
 Qe4phJrNVzrfa303/KdlL9ekhgjR9uCnUQpR0nbIY5EyaTQElfrYIquacYMxbRtapDMSt2lUc
 hJA0o13jDzXD8JitvF0W+F8tRk2p/B/dfRpoRWW1np6unuTNUfYENZbh1IR404Iuvs/AZSqrD
 PNXTnCOptwer9QukS6Stiw+AUrUBIdDHcjxnVoyJpl9XgGiQIVHu1Q2hbEbdyIjLpT/UxlEGu
 W+2vkyb3EbL2+c9+SBgH9NbhtMqZ7vfgqnZboLGcFVBwRSsV5rx3WYmxa63HGYJmAeJJfrHJT
 MR6qVN4X4QWTr2vE56vGjEbWTVYqMhIuw9m7uKUZIVYiEiz06rvqJOHUezc+dTlDMuDB8UE4x
 tahFyQP+Q4BoAULbP6UTJbC85GQoL5N5b6O8i5dOm4Hg+/w+yP0qpl6xmKgK3SUbqbOPGY8v8
 c+rVGIpmZ3JTklkWVpYYJIexo0HAX5txDonv93v3eYg08tEUo+cu78EDX4yQSOZdE7gZsUu1o
 XKAHrGiGmdZZ0eDicvJfjgMrYnVXBlkvHgnZy1Zynar0V8QbavzNBIzwr/AI1ZZCtHBHed7/S
 lJwoYJTyRHsRuiApHwxBJM3maSioloYQ8uz4a2Q/fiybmjfTJKwHeQcANcsi5RHgq1P7aGR4E
 CLmmqTAFcvun22kJEntcGOqH7nMEYNc9ZWquBDi0JuACSd3gibONAyRz+j7VkcNzUntngipBL
 Wo7qcOuN42s2CQlzgEWYW5n9pusJ+AbEev62n0IVfeUXhKUYJ8GVjCy4WAZ4p4TnJyM/Ce0JW
 MAde8LQvlhhwVr4He89nVxJJp101IraUuGDTpjykQQd3CpuDTnz/1Jo4UJgikOG2Fp+tOWRPT
 prkAx94sU5zwb1xa6fquWvSeyrEFknSa5b4Rfk/r1VRKP7TRHa5zZY3aU6IOxgGWI2i2vETSP
 TrvFVRbbBM5bLOcazIyrTQf0/ILAEf1gxQA3yYfe/dpTfDC+Tj8S5Y5fv14tsaga3AmqCV9I5
 xjjMUdaGPiE3Juj7SY0ig63hop2FBF

You missed to CC fbdev mailing list.

On 1/9/25 00:03, Laurent Pinchart wrote:
> On Wed, Jan 08, 2025 at 10:15:37AM +0900, Joe Hattori wrote:
>> dss_of_port_get_parent_device() leaks an OF node reference when i >=3D =
2
>> and struct device_node *np is present. Since of_get_next_parent()
>> obtains a reference of the returned OF node, call of_node_put() before
>> returning NULL.
>>
>> This was found by an experimental verifier that I am developing, and no
>> runtime test was able to be performed due to that lack of actual
>> devices.
>>
>> Fixes: f76ee892a99e ("omapfb: copy omapdss & displays for omapfb")
>> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
>> ---
>>   drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 1 +
>>   1 file changed, 1 insertion(+)

Applied to fbdev git tree.
Please speak up if you want to take it through another tree.

Helge



