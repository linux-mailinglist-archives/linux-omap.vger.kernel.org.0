Return-Path: <linux-omap+bounces-353-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFA8838EAC
	for <lists+linux-omap@lfdr.de>; Tue, 23 Jan 2024 13:43:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCDE01F265F3
	for <lists+linux-omap@lfdr.de>; Tue, 23 Jan 2024 12:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB5D5EE6C;
	Tue, 23 Jan 2024 12:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XJCozqNf"
X-Original-To: linux-omap@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5915DF2E
	for <linux-omap@vger.kernel.org>; Tue, 23 Jan 2024 12:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706013806; cv=none; b=s4W8+J+OBWb7mqMtZS2ccLCXw3YDRC4HyU7o3+J9Mzs+wSbtYkCXHfL+4jJbBFO/raoAU4YbKvQhNDgKw7nZkbwsSVFECcD7/CRmUzVxzzgFBr9rolxz8s/PF4sGr8Ufun7sUyp3t8eJPKtvM26FYJbpzGGX0jzKU5OClhFyJqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706013806; c=relaxed/simple;
	bh=84yjr7gbpEkRE8gAzV/hpUqJKBt7miw2N0I7r2yHdrw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e7IMf1usAWOH3v0qxesHcUnaewi63YJB4J50JaKnzizEaWWSpiLeyFb+zLrqY2T4sNTqxQrfsWvTQJ9fKJ8SQeszuqij6n1bFoVjb1bzxoWsreWJ13/guo9V2WeTdGp8nL1tF820RDHOggueyHp/8PxjmpOXEdMovGvcugI/ko8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XJCozqNf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706013803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=u1qcZn2nMXqL+D3a89leltZffSAbMsnoEG5Bg++SMtY=;
	b=XJCozqNf+J6yUzKq85xGKloczEx/ZUT0NPdH/PSNjiRNqlYeZJlGeBAo6XPEOsUhkz1vn0
	4ZZc2ywAneQuiWGCcDv/nqgl2e7bBwGNrbN59wx+Wz1tsqLuFk+Hd9hb5srLpafMB6yRg1
	Wr9MuICiVYcyy/LRw0axxp/7+EY9Zp0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-CG7oQgjbNReG07WxtynNgQ-1; Tue, 23 Jan 2024 07:43:21 -0500
X-MC-Unique: CG7oQgjbNReG07WxtynNgQ-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-78313358d3bso128621385a.0
        for <linux-omap@vger.kernel.org>; Tue, 23 Jan 2024 04:43:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706013801; x=1706618601;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u1qcZn2nMXqL+D3a89leltZffSAbMsnoEG5Bg++SMtY=;
        b=PhUPmRPO96l9fH2WTXMuFZ/ekHqjLh/nh03GXG6ErE6ROkFnomMnOaa3lv66ar7Dss
         V7/a5PVVI36GqOehPkPDpKsQDRiaNS2r7eqISPqW3k0LBFbDyKs0CDptpC2OUMH3vxHI
         JdswTis063sfUrtRNAmZUhR2wlLLjzFjgPhPHgEdKdoBz7ZkWohnqCepUP/Wp760X0Ww
         GV8h4jgWNbzo33cGEBB9Mj+nzHfkUbex235EiPeHbHSkQXeeejvAkoUsAGyrG/bnoq8J
         evnJxpirhEPzl0M1P2a3KDZoEqdbz34BHxmowH2NCLJA2YXq3d+/i0JH+W2rBHen0lq3
         lUUQ==
X-Gm-Message-State: AOJu0YwRIHfAg88cqH+r0m6gPF2x3Br3bJHE8lnLUFiApB4DtNs9oa2C
	sbP38PV55jl8rwPqPRMlwzM7b8tJLRuagaSyj4QWab7vLr+0EPCYioQgvOqn1PZ2lHyWlviSpHD
	Ub36fus2UeJKpYOzAXIBRlvL7xtcNl64VumQS87lPDRSEaYICbHVCVk90RLU=
X-Received: by 2002:a05:6214:300c:b0:685:70d7:3336 with SMTP id ke12-20020a056214300c00b0068570d73336mr10461970qvb.4.1706013801439;
        Tue, 23 Jan 2024 04:43:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHddoLwefm0Y9mdzFqyJ9YMpEh0BhkY6oGG0QP+cH6Hmafi6vzmDJz9IZDmLyFlIVYpCQIuvA==
X-Received: by 2002:a05:6214:300c:b0:685:70d7:3336 with SMTP id ke12-20020a056214300c00b0068570d73336mr10461956qvb.4.1706013801087;
        Tue, 23 Jan 2024 04:43:21 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-245-66.dyn.eolo.it. [146.241.245.66])
        by smtp.gmail.com with ESMTPSA id nw7-20020a0562143a0700b0068696e28763sm1437245qvb.127.2024.01.23.04.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 04:43:20 -0800 (PST)
Message-ID: <5e7f5cf2e13e36d9ad4b1d4c546c6f596c2dc8f6.camel@redhat.com>
Subject: Re: [PATCH V2] net: ethernet: ti: cpsw_new: enable mac_managed_pm
 to fix mdio
From: Paolo Abeni <pabeni@redhat.com>
To: Sinthu Raja <sinthu.raja@mistralsolutions.com>, Denis Kirjanov
 <dkirjanov@suse.de>, Siddharth Vadapalli <s-vadapalli@ti.com>, Ravi
 Gunasekaran <r-gunasekaran@ti.com>, Roger Quadros <rogerq@kernel.org>
Cc: linux-omap@vger.kernel.org, netdev@vger.kernel.org, Sinthu Raja
	 <sinthu.raja@ti.com>
Date: Tue, 23 Jan 2024 13:43:18 +0100
In-Reply-To: <20240122093326.7618-1-sinthu.raja@ti.com>
References: <20240122093326.7618-1-sinthu.raja@ti.com>
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-01-22 at 15:03 +0530, Sinthu Raja wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>

Please respect the 24h grace period before posting a new version:

https://elixir.bootlin.com/linux/latest/source/Documentation/process/mainta=
iner-netdev.rst#L399

Also please keep a consistent revision numbering scheme. This v2
apparently come after v3 ?!?

> The below commit  introduced a WARN when phy state is not in the states:
> PHY_HALTED, PHY_READY and PHY_UP.
> commit 744d23c71af3 ("net: phy: Warn about incorrect mdio_bus_phy_resume(=
) state")
>=20
> When cpsw_new resumes, there have port in PHY_NOLINK state, so the below
> warning comes out. Set mac_managed_pm be true to tell mdio that the phy
> resume/suspend is managed by the mac, to fix the following warning:
>=20
> WARNING: CPU: 0 PID: 965 at drivers/net/phy/phy_device.c:326 mdio_bus_phy=
_resume+0x140/0x144
> CPU: 0 PID: 965 Comm: sh Tainted: G           O       6.1.46-g247b2535b2 =
#1
> Hardware name: Generic AM33XX (Flattened Device Tree)
>  unwind_backtrace from show_stack+0x18/0x1c
>  show_stack from dump_stack_lvl+0x24/0x2c
>  dump_stack_lvl from __warn+0x84/0x15c
>  __warn from warn_slowpath_fmt+0x1a8/0x1c8
>  warn_slowpath_fmt from mdio_bus_phy_resume+0x140/0x144
>  mdio_bus_phy_resume from dpm_run_callback+0x3c/0x140
>  dpm_run_callback from device_resume+0xb8/0x2b8
>  device_resume from dpm_resume+0x144/0x314
>  dpm_resume from dpm_resume_end+0x14/0x20
>  dpm_resume_end from suspend_devices_and_enter+0xd0/0x924
>  suspend_devices_and_enter from pm_suspend+0x2e0/0x33c
>  pm_suspend from state_store+0x74/0xd0
>  state_store from kernfs_fop_write_iter+0x104/0x1ec
>  kernfs_fop_write_iter from vfs_write+0x1b8/0x358
>  vfs_write from ksys_write+0x78/0xf8
>  ksys_write from ret_fast_syscall+0x0/0x54
> Exception stack(0xe094dfa8 to 0xe094dff0)
> dfa0:                   00000004 005c3fb8 00000001 005c3fb8 00000004 0000=
0001
> dfc0: 00000004 005c3fb8 b6f6bba0 00000004 00000004 0059edb8 00000000 0000=
0000
> dfe0: 00000004 bed918f0 b6f09bd3 b6e89a66
>=20
> Fixes: 744d23c71af3 ("net: phy: Warn about incorrect mdio_bus_phy_resume(=
) state")

I think the real issue was introduced somewhere else in the TI driver.
The above commit just report the inconsistent state.

Note that you probably will a small series of 2 separate patches to
address the issue bot in cpsw_new.c and cpsw.c, as mentioned by Roger.

Cheers,

Paolo


