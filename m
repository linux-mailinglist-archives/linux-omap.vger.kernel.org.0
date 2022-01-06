Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 218834864A1
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jan 2022 13:53:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239009AbiAFMxn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 6 Jan 2022 07:53:43 -0500
Received: from mail.wizzup.org ([95.217.97.174]:45590 "EHLO wizzup.org"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231899AbiAFMxn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 6 Jan 2022 07:53:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org;
        s=mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
        Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=DbXMhpZ6oy10ugKFlEiPIwocr0y9dCIYfgOWxYnzvTQ=; b=CRX+CoCFUvTFsCNUb/uTiQxOpA
        tUXDmNKuYHViqLWictlgL2Jq1bbq7VnBR6exiYrZUnBIBxmog/eQ3V/Kvgx2C1+AtncKlDiu9adiA
        RHWgHenMXwxZ+5MAzFl+y2+LTxUO+aLC62O8N0ZKtsSre+Yzq/1W6yiw7JfUs1bWYnJZnsK/g7cgX
        zhhY8Dyu75zbqfXO6NfB8nDbXz+xBCeHgj2wxLcnUX2kGClGiTykzKLF4APCnF3P+uAYXgQyNEaEo
        7oyerF7Uh9Uk+WEJ4kXoOk/ljvVHRO2fUffGdc54uUzhvlC8VNJwKPDc3Mlnf2Ae6PJIbj5drRd5t
        5iixaKPg==;
Received: from [45.83.235.159] (helo=[0.0.0.0])
        by wizzup.org with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <merlijn@wizzup.org>)
        id 1n5SGv-00046r-Ij; Thu, 06 Jan 2022 12:53:37 +0000
Subject: Re: Nokia N900 increased power draw with panel-sony-acx565akm loaded
 v5.9 and v5.10
From:   Merlijn Wajer <merlijn@wizzup.org>
To:     Sebastian Reichel <sre@kernel.org>
Cc:     linux-omap <linux-omap@vger.kernel.org>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Dev Null <devnull@uvos.xyz>, Pavel Machek <pavel@ucw.cz>,
        Tony Lindgren <tony@atomide.com>
References: <001a77db-80c0-d000-3d78-b9b301669826@wizzup.org>
 <20211213131023.ese6lrkayj4qopfa@earth.universe>
 <968dbb4a-3944-7226-d686-379a442be7ef@wizzup.org>
Message-ID: <e8766733-baba-72e8-5638-f7b02fab2601@wizzup.org>
Date:   Thu, 6 Jan 2022 13:53:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <968dbb4a-3944-7226-d686-379a442be7ef@wizzup.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Sebastian,

On 16/12/2021 14:06, Merlijn Wajer wrote:
> Hi Sebastian,
> 
> [...]
> 
> With this additional patch applied the device seems to idle at lower
> power usage in the test environment I described in my previous email.
> That is, it idles at at 42mW with the panel probed, as opposed to 60mW
> with the panel probed. I also just booted to my Maemo Leste environment
> and the panel still comes up fine and seems to behave fine.
> 
> Is there additional testing I can perform to make sure this patch is the
> right one?

Just an update, Ivaylo is seeing some problems with this patch, so we
might have to dig in deeper later on. I'll keep the patch around, but it
shouldn't be merged at this point in time.

Regards,
Merlijn
