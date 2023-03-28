Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF276CB358
	for <lists+linux-omap@lfdr.de>; Tue, 28 Mar 2023 03:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232377AbjC1Bqu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Mar 2023 21:46:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232446AbjC1Bqt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 27 Mar 2023 21:46:49 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E677211E
        for <linux-omap@vger.kernel.org>; Mon, 27 Mar 2023 18:46:43 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4PlssB56NBz17N4t;
        Tue, 28 Mar 2023 09:43:26 +0800 (CST)
Received: from [10.67.110.176] (10.67.110.176) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Mar 2023 09:46:40 +0800
Subject: Re: [PATCH 0/3] Remove unused declarations from arm
To:     Tony Lindgren <tony@atomide.com>
CC:     <paul@pwsan.com>, <linux@armlinux.org.uk>, <khilman@kernel.org>,
        <daniel@zonque.org>, <haojian.zhuang@gmail.com>,
        <robert.jarzmik@free.fr>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20220920130110.1104272-1-cuigaosheng1@huawei.com>
 <Y2tiucLEcPyTTmwv@atomide.com> <20230327080229.GC7501@atomide.com>
From:   cuigaosheng <cuigaosheng1@huawei.com>
Message-ID: <f26011c6-3abd-741e-eafb-b74f0162652b@huawei.com>
Date:   Tue, 28 Mar 2023 09:46:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20230327080229.GC7501@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.110.176]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-2.3 required=5.0 tests=NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

> Looks like the two omap related patch in this series are no longer
> needed after Arnd's clean-up has been merged. If I missed something,
> please resend updated patches.

Thanks for taking time to review these patches, these issue have been
fixed in linux next.

Gaosheng

On 2023/3/27 16:02, Tony Lindgren wrote:
> * Tony Lindgren <tony@atomide.com> [221109 08:10]:
>> Hi,
>>
>> * Gaosheng Cui <cuigaosheng1@huawei.com> [220920 15:53]:
>>> This series contains a few cleanup patches, to remove unused
>>> declarations which have been removed. Thanks!
>> FYI, let's wait a bit longer with these until we have Arnd's pending
>> clean-up patches in Linux next as they remove some unused functions
>> too.
> Looks like the two omap related patch in this series are no longer
> needed after Arnd's clean-up has been merged. If I missed something,
> please resend updated patches.
>
> Thanks,
>
> Tony
>
> .
