Return-Path: <linux-omap+bounces-505-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB7584AE46
	for <lists+linux-omap@lfdr.de>; Tue,  6 Feb 2024 07:01:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D76202851DA
	for <lists+linux-omap@lfdr.de>; Tue,  6 Feb 2024 06:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D28839F2;
	Tue,  6 Feb 2024 06:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="l0Lktz38"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CD480033;
	Tue,  6 Feb 2024 06:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707199272; cv=none; b=AbwJKcs2/jO62nBP8X3wZ2790hMo3+BlC6mX5HqxUgmLjS2SkWKJW/svKaa1wNX2xHDcrF42bTa5JmumGVcxPF0X4MkPHWBErZhlErCe+/HtK2Xq7mRrj7L/83ODdM71Ua2NOpPqwoESy1zsuz8JnN5EH53HeOQx0KzWT9rgVKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707199272; c=relaxed/simple;
	bh=jkbiFNX75xlQ3enDQ3rgOWMvtXStBFWPWkLX5dVz3Ew=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OKMZGXuzUAW8ga+TLrvbRTnd+Uq3+bKNfsRiKj1+aP6nuCaJxlnRzbr6oXsaRjh7VhtXZiZbYFVVXZwRjwTwAXe1b6s5bX/77MKnrHbhlT5djcH41C1oTh+tLMjSRuNojazr/MAAgKl4lyDhBibDlQ0xmfaB4YvicUORyfQa+/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=l0Lktz38; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41660r0K043457;
	Tue, 6 Feb 2024 00:00:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707199253;
	bh=x39fB5SlIA9bI6mUC1F0RcH5xJBxO+Mz+Zp4GYSW2f0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=l0Lktz38x4bXfKZdihKiXZc+qYNAoG+JJOM2zFb5kTJWhycJzhCprYaJuxe0iNhy3
	 HaeCVsuOtjmcpLUv1rkj6een36hv1xezWlVQN2ZMeAUs0GNiBQ1eq2h/JjQxQJsqrS
	 +1KfA+660X6qnQ/dnCzhvNGGy+i8M8kY0vIZx7ik=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41660rrY029536
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Feb 2024 00:00:53 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Feb 2024 00:00:53 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Feb 2024 00:00:53 -0600
Received: from [172.24.227.88] (uda0500640.dhcp.ti.com [172.24.227.88])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41660nrS076378;
	Tue, 6 Feb 2024 00:00:50 -0600
Message-ID: <2ffdca7f-f865-b719-b701-9ed4716da71a@ti.com>
Date: Tue, 6 Feb 2024 11:30:49 +0530
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V3 1/2] net: ethernet: ti: cpsw_new: enable mac_managed_pm
 to fix mdio
Content-Language: en-US
To: Sinthu Raja <sinthu.raja@mistralsolutions.com>,
        Denis Kirjanov
	<dkirjanov@suse.de>,
        Siddharth Vadapalli <s-vadapalli@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>
CC: <linux-omap@vger.kernel.org>, <netdev@vger.kernel.org>,
        Sinthu Raja
	<sinthu.raja@ti.com>, <stable@vger.kernel.org>,
        Ravi Gunasekaran
	<r-gunasekaran@ti.com>,
        Paolo Abeni <pabeni@redhat.com>
References: <20240206005928.15703-1-sinthu.raja@ti.com>
 <20240206005928.15703-2-sinthu.raja@ti.com>
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
In-Reply-To: <20240206005928.15703-2-sinthu.raja@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180



On 2/6/24 6:29 AM, Sinthu Raja wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> The below commit  introduced a WARN when phy state is not in the states:
> PHY_HALTED, PHY_READY and PHY_UP.
> commit 744d23c71af3 ("net: phy: Warn about incorrect mdio_bus_phy_resume() state")
> 
> When cpsw_new resumes, there have port in PHY_NOLINK state, so the below
> warning comes out. Set mac_managed_pm be true to tell mdio that the phy
> resume/suspend is managed by the mac, to fix the following warning:
> 
> WARNING: CPU: 0 PID: 965 at drivers/net/phy/phy_device.c:326 mdio_bus_phy_resume+0x140/0x144
> CPU: 0 PID: 965 Comm: sh Tainted: G           O       6.1.46-g247b2535b2 #1
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
> dfa0:                   00000004 005c3fb8 00000001 005c3fb8 00000004 00000001
> dfc0: 00000004 005c3fb8 b6f6bba0 00000004 00000004 0059edb8 00000000 00000000
> dfe0: 00000004 bed918f0 b6f09bd3 b6e89a66
> 
> Cc: <stable@vger.kernel.org> # v6.0+
> Fixes: 744d23c71af3 ("net: phy: Warn about incorrect mdio_bus_phy_resume() state")

In v1, you received a comment to add the fixes tag. The reference stmmac patch also points
to this commit as Fixes tag. But as Paolo pointed out in v2, this is not the right
fixes tag for your patch series.

I did a git blame on few drivers where PHY is managed by MAC. These have 
Fixes: fba863b81604 ("net: phy: make PHY PM ops a no-op if MAC driver manages PHY PM")
which seems to be more appropriate, as this is the commit that introduced the
'mac_managed_pm' flag.

I have Cc'ed Paolo in this reply. But in future, please take care of adding the people
who provided review comments in To/Cc when sending reworked patch/series.

> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> ---
> 
> Changes in V3:
> 	- No Change
> 
> Changes in V2:
> 	- Add fixes tag.
> 
>  drivers/net/ethernet/ti/cpsw_new.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/ethernet/ti/cpsw_new.c b/drivers/net/ethernet/ti/cpsw_new.c
> index 498c50c6d1a7..087dcb67505a 100644
> --- a/drivers/net/ethernet/ti/cpsw_new.c
> +++ b/drivers/net/ethernet/ti/cpsw_new.c
> @@ -773,6 +773,9 @@ static void cpsw_slave_open(struct cpsw_slave *slave, struct cpsw_priv *priv)
>  			slave->slave_num);
>  		return;
>  	}
> +
> +	phy->mac_managed_pm = true;
> +
>  	slave->phy = phy;
>  
>  	phy_attached_info(slave->phy);

-- 
Regards,
Ravi

