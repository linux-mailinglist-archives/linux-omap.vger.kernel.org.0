Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1421439DAEE
	for <lists+linux-omap@lfdr.de>; Mon,  7 Jun 2021 13:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbhFGLSt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Jun 2021 07:18:49 -0400
Received: from sender11-of-o51.zoho.eu ([31.186.226.237]:21143 "EHLO
        sender11-of-o51.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230131AbhFGLSs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Jun 2021 07:18:48 -0400
X-Greylist: delayed 905 seconds by postgrey-1.27 at vger.kernel.org; Mon, 07 Jun 2021 07:18:48 EDT
ARC-Seal: i=1; a=rsa-sha256; t=1623063700; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=DwLbaAFSYAkYrdsX4eYmQ7gzyL/pobo8voA/OtVKP+s8evEwZC2/npuuvYdh78Bhb68AN5r7JeRe/Xtig/DmqKN++n2P/vg7I/vhJLM2PMTmZb1o3koOyGbSsxUgrR40lCBjrzDnJNnZIQhsiF0w16jcMN+/0biEZvzyPK/xviw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1623063700; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=tTctdPBmZhp9bU602PpAPLwteFaDN5q2vDa5K/eRLRo=; 
        b=ItqAef13CZjfNjmW6F65bcobA56jI1qUtVdmGdjn19jcwFlMnthqnsz/ByRGXs/pHZ96GoOxjht4CtUGrw+Dvsxy8NeJhE9RjiO79H0i/czgdCGTkE6d3T5z8EEWjletJjdHfBZAlmM0WoUseURbqA43VjcAey5jIzJcm5mXsoM=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz>
Received: from UVOSLinux (ip-95-222-215-167.hsi15.unitymediagroup.de [95.222.215.167]) by mx.zoho.eu
        with SMTPS id 1623063697785254.68952721494577; Mon, 7 Jun 2021 13:01:37 +0200 (CEST)
Date:   Mon, 7 Jun 2021 13:01:37 +0200
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 2/2] power: supply: cpcap-battery: kconfig: depend on
 ( NVMEM || !NVMEM )
Message-Id: <20210607130137.0df783dce66301510894a7cc@uvos.xyz>
In-Reply-To: <20210604125540.zfhpffdxft3ug46d@earth.universe>
References: <20210423145702.e31dd7be8843d97195f98bd3@uvos.xyz>
        <20210604125540.zfhpffdxft3ug46d@earth.universe>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

> This is missing a long patch description, but needs to be squashed
> into PATCH 1/2 anyways.
> 
> Thanks,
> 
> -- Sebastian

Im thinking I would rather just drop this entirely, since at least I
and one other user use cpcap-battery with a 3rd party battery with no
nvmem, and Tony and Merlijn use it with a lab power supply.

In these cases requireing NVMEM makes no sense and the code in 
"power: supply: cpcap-battery: Add battery type auto detection
for mapphone devices" works fine without.

-- 
Carl Philipp Klemm <philipp@uvos.xyz> <carl@uvos.xyz>
