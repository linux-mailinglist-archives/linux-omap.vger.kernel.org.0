Return-Path: <linux-omap+bounces-1788-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EA893DD80
	for <lists+linux-omap@lfdr.de>; Sat, 27 Jul 2024 08:27:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD4781C22A4C
	for <lists+linux-omap@lfdr.de>; Sat, 27 Jul 2024 06:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C5C61F94D;
	Sat, 27 Jul 2024 06:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oox6H1aF"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191471FC4;
	Sat, 27 Jul 2024 06:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722061654; cv=none; b=ie6mfORMvkjaP2NfzSfz5ckUdkDrNImyHnRDLT/LkOWVUf67h1R2XlAVj+RddK+mutmSjomDKqiHbO6yZmfBxp3guKzsfR3WZnmulZgvUVOwkr/hFJ/CrS/MLl0sK9C84owkOqC54aPyyrl2XZoTleaj4Opuw7IG40XZgJrNQvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722061654; c=relaxed/simple;
	bh=GmLqznNPm3VKhV6utGRBP2na4b4+UkeqqW08Zg+oKWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bsLpIGpcH9M6zBj9vDqqZfVdLV493A60brYDlEHU8Hq0DyuQ5pLw5oVAqranzUlZwZMW6X67o6rWE2S3V8A7zTsRvWnD7iReOoyb1GDANpB2juuFgdnCgAlF+OpTKpa+wHkkioObEj4hO20lGYqoJYbIhq2tm/LIhUBNfK2jcSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oox6H1aF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20166C32781;
	Sat, 27 Jul 2024 06:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722061653;
	bh=GmLqznNPm3VKhV6utGRBP2na4b4+UkeqqW08Zg+oKWk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Oox6H1aFktJSX07nUICXKLMU6Cx34Yp7OkUa38/6uJOoEcRpYKFMoS9BxeY1I8Oky
	 cWu1zzoL5ivhaU0uW4uyFZe2uiTLZdPySlylAMqUoH0f9HZXfi1IdmAXWkTyGSDwMd
	 uPjZPckv0eNaA9tkaLdo4TSa2x9f5Gtctcn4SFQFNVsAgCnI+KuGWQL3mDmw5C49OA
	 zwo/x/CzodgOHRMChRUuMxCQAbkPwIcoaT+4ni6l46Ql8Mv/9OTheyq9arJwU4KgAx
	 xmsuWAJgl5QBdkJUmVqmdphnWSTBUHuweQFQDRV1GPO3130mj7xIocGU+TQX2A9pQQ
	 vjWXnBf6sXqeA==
Message-ID: <026318a3-9406-4988-9bed-66186a2713f9@kernel.org>
Date: Sat, 27 Jul 2024 09:27:27 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 1/6] net: ethernet: ti: am65-cpsw: Introduce
 multi queue Rx
To: Brett Creeley <bcreeley@amd.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, Julien Panis <jpanis@baylibre.com>
Cc: Simon Horman <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 srk@ti.com, vigneshr@ti.com, danishanwar@ti.com, pekka Varis
 <p-varis@ti.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org
References: <20240703-am65-cpsw-multi-rx-v3-0-f11cd860fd72@kernel.org>
 <20240703-am65-cpsw-multi-rx-v3-1-f11cd860fd72@kernel.org>
 <2a1b2099-e1c4-4d04-bc97-9ff7e0621275@amd.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <2a1b2099-e1c4-4d04-bc97-9ff7e0621275@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 24/07/2024 00:10, Brett Creeley wrote:
> 
> 
> On 7/3/2024 6:51 AM, Roger Quadros wrote:
>> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>>
>>
>> am65-cpsw can support up to 8 queues at Rx.
>> Use a macro AM65_CPSW_MAX_RX_QUEUES to indicate that.
>> As there is only one DMA channel for RX traffic, the
>> 8 queues come as 8 flows in that channel.
>>
>> By default, we will start with 1 flow as defined by the
>> macro AM65_CPSW_DEFAULT_RX_CHN_FLOWS.
>>
>> User can change the number of flows by ethtool like so
>> 'ethtool -L ethx rx <N>'
>>
>> All traffic will still come on flow 0. To get traffic on
>> different flows the Classifiers will need to be set up.
>>
>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
>> Reviewed-by: Simon Horman <horms@kernel.org>
>> ---
>> Changelog:
>> v3:
>> - style fixes: reverse xmas tree and checkpatch.pl --max-line-length=80
>> - typo fix: Classifer -> Classifier
>> - added Reviewed-by Simon Horman
>> ---
>>   drivers/net/ethernet/ti/am65-cpsw-ethtool.c |  62 +++--
>>   drivers/net/ethernet/ti/am65-cpsw-nuss.c    | 367 ++++++++++++++++------------
>>   drivers/net/ethernet/ti/am65-cpsw-nuss.h    |  36 +--
>>   3 files changed, 284 insertions(+), 181 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/ti/am65-cpsw-ethtool.c b/drivers/net/ethernet/ti/am65-cpsw-ethtool.c
>> index a1d0935d1ebe..01e3967852e0 100644
>> --- a/drivers/net/ethernet/ti/am65-cpsw-ethtool.c
>> +++ b/drivers/net/ethernet/ti/am65-cpsw-ethtool.c
>> @@ -429,7 +429,7 @@ static void am65_cpsw_get_channels(struct net_device *ndev,
>>
>>          ch->max_rx = AM65_CPSW_MAX_RX_QUEUES;
>>          ch->max_tx = AM65_CPSW_MAX_TX_QUEUES;
>> -       ch->rx_count = AM65_CPSW_MAX_RX_QUEUES;
>> +       ch->rx_count = common->rx_ch_num_flows;
>>          ch->tx_count = common->tx_ch_num;
>>   }
>>
>> @@ -448,8 +448,10 @@ static int am65_cpsw_set_channels(struct net_device *ndev,
>>                  return -EBUSY;
>>
>>          am65_cpsw_nuss_remove_tx_chns(common);
>> +       am65_cpsw_nuss_remove_rx_chns(common);
>>
>> -       return am65_cpsw_nuss_update_tx_chns(common, chs->tx_count);
>> +       return am65_cpsw_nuss_update_tx_rx_chns(common, chs->tx_count,
>> +                                               chs->rx_count);
>>   }
>>
>>   static void
>> @@ -920,11 +922,13 @@ static int am65_cpsw_get_coalesce(struct net_device *ndev, struct ethtool_coales
>>                                    struct netlink_ext_ack *extack)
>>   {
>>          struct am65_cpsw_common *common = am65_ndev_to_common(ndev);
>> +       struct am65_cpsw_rx_flow *rx_flow;
>>          struct am65_cpsw_tx_chn *tx_chn;
>>
>>          tx_chn = &common->tx_chns[0];
>> +       rx_flow = &common->rx_chns.flows[0];
>>
>> -       coal->rx_coalesce_usecs = common->rx_pace_timeout / 1000;
>> +       coal->rx_coalesce_usecs = rx_flow->rx_pace_timeout / 1000;
>>          coal->tx_coalesce_usecs = tx_chn->tx_pace_timeout / 1000;
>>
>>          return 0;
>> @@ -934,14 +938,26 @@ static int am65_cpsw_get_per_queue_coalesce(struct net_device *ndev, u32 queue,
>>                                              struct ethtool_coalesce *coal)
>>   {
>>          struct am65_cpsw_common *common = am65_ndev_to_common(ndev);
>> +       struct am65_cpsw_rx_flow *rx_flow;
>>          struct am65_cpsw_tx_chn *tx_chn;
>>
>> -       if (queue >= AM65_CPSW_MAX_TX_QUEUES)
>> +       if (queue >= AM65_CPSW_MAX_TX_QUEUES &&
>> +           queue >= AM65_CPSW_MAX_RX_QUEUES)
>>                  return -EINVAL;
>>
>> -       tx_chn = &common->tx_chns[queue];
>> +       if (queue < AM65_CPSW_MAX_TX_QUEUES) {
>> +               tx_chn = &common->tx_chns[queue];
>> +               coal->tx_coalesce_usecs = tx_chn->tx_pace_timeout / 1000;
>> +       } else {
>> +               coal->tx_coalesce_usecs = ~0;
>> +       }
>>
>> -       coal->tx_coalesce_usecs = tx_chn->tx_pace_timeout / 1000;
>> +       if (queue < AM65_CPSW_MAX_RX_QUEUES) {
>> +               rx_flow = &common->rx_chns.flows[queue];
>> +               coal->rx_coalesce_usecs = rx_flow->rx_pace_timeout / 1000;
>> +       } else {
>> +               coal->rx_coalesce_usecs = ~0;
>> +       }
> 
> Minor nit, but after removing the dead code below the check for queue being greater than max values, I think am65_cpsw_get_coalesce() and am65_get_per_queue_coalesce() are identical except the "u32 queue" argument.
> 
> I think you could do something like the following:
> 
> static int am65_cpsw_get_per_queue_coalesce(struct net_device *ndev,
>                   struct ethtool_coalesce *coal,
>                   struct netlink_ext_ack *extack)
> {
>     return __am65_cpsw_get_coalesce(ndev, coal, 0);
> }
> 
> static int am65_cpsw_get_coalesce(struct net_device *ndev, u32 queue,
>                   struct ethtool_coalesce *coal,
>                   struct netlink_ext_ack *extack,
>                   u32 )
> {
>     return __am65_cpsw_get_coalesce(ndev, coal, queue);
> }
> 

Sure, this is much nicer.

>>
>>          return 0;
>>   }
>> @@ -951,9 +967,11 @@ static int am65_cpsw_set_coalesce(struct net_device *ndev, struct ethtool_coales
>>                                    struct netlink_ext_ack *extack)
>>   {
>>          struct am65_cpsw_common *common = am65_ndev_to_common(ndev);
>> +       struct am65_cpsw_rx_flow *rx_flow;
>>          struct am65_cpsw_tx_chn *tx_chn;
>>
>>          tx_chn = &common->tx_chns[0];
>> +       rx_flow = &common->rx_chns.flows[0];
>>
>>          if (coal->rx_coalesce_usecs && coal->rx_coalesce_usecs < 20)
>>                  return -EINVAL;
>> @@ -961,7 +979,7 @@ static int am65_cpsw_set_coalesce(struct net_device *ndev, struct ethtool_coales
>>          if (coal->tx_coalesce_usecs && coal->tx_coalesce_usecs < 20)
>>                  return -EINVAL;
> 
> Why does this return -EINVAL here, but am65_cpsw_set_per_queue_coalesce() prints a dev_info() and then set the value to 20?
> 
> Would it better to have consistent behavior? Maybe I'm missing some context or reasoning here?

Consistent behaviour is better.

> 
>>
>> -       common->rx_pace_timeout = coal->rx_coalesce_usecs * 1000;
>> +       rx_flow->rx_pace_timeout = coal->rx_coalesce_usecs * 1000;
>>          tx_chn->tx_pace_timeout = coal->tx_coalesce_usecs * 1000;
>>
>>          return 0;
>> @@ -971,20 +989,36 @@ static int am65_cpsw_set_per_queue_coalesce(struct net_device *ndev, u32 queue,
>>                                              struct ethtool_coalesce *coal)
>>   {
>>          struct am65_cpsw_common *common = am65_ndev_to_common(ndev);
>> +       struct am65_cpsw_rx_flow *rx_flow;
>>          struct am65_cpsw_tx_chn *tx_chn;
>>
>> -       if (queue >= AM65_CPSW_MAX_TX_QUEUES)
>> +       if (queue >= AM65_CPSW_MAX_TX_QUEUES &&
>> +           queue >= AM65_CPSW_MAX_RX_QUEUES)
>>                  return -EINVAL;
>>
>> -       tx_chn = &common->tx_chns[queue];
>> +       if (queue < AM65_CPSW_MAX_TX_QUEUES) {
>> +               tx_chn = &common->tx_chns[queue];
>> +
>> +               if (coal->tx_coalesce_usecs && coal->tx_coalesce_usecs < 20) {
>> +                       dev_info(common->dev, "defaulting to min value of 20us for tx-usecs for tx-%u\n",
>> +                                queue);
>> +                       coal->tx_coalesce_usecs = 20;
>> +               }
>>
>> -       if (coal->tx_coalesce_usecs && coal->tx_coalesce_usecs < 20) {
>> -               dev_info(common->dev, "defaulting to min value of 20us for tx-usecs for tx-%u\n",
>> -                        queue);
>> -               coal->tx_coalesce_usecs = 20;
>> +               tx_chn->tx_pace_timeout = coal->tx_coalesce_usecs * 1000;
>>          }
>>
>> -       tx_chn->tx_pace_timeout = coal->tx_coalesce_usecs * 1000;
>> +       if (queue < AM65_CPSW_MAX_RX_QUEUES) {
>> +               rx_flow = &common->rx_chns.flows[queue];
>> +
>> +               if (coal->rx_coalesce_usecs && coal->rx_coalesce_usecs < 20) {
>> +                       dev_info(common->dev, "defaulting to min value of 20us for rx-usecs for rx-%u\n",
>> +                                queue);
> 
> Would it make more sense to just return -EINVAL here similar to the standard "set_coalesce"?

Yes, I'll do that in next spin.

> 
>> +                       coal->rx_coalesce_usecs = 20;
>> +               }
>> +
>> +               rx_flow->rx_pace_timeout = coal->rx_coalesce_usecs * 1000;
>> +       }
>>
>>          return 0;
>>   }
> 
> I think my comment to the "get" and "get_per_queue" versions of these functions also applies here, but only if the behavior of returning -EINVAL or setting a value for the user is the same between the "set" and "set_per_queue".

Thanks for the review!

> 
> Thanks,
> 
> Brett
> 
> <snip>
> 

-- 
cheers,
-roger

