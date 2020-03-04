Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15284179705
	for <lists+linux-omap@lfdr.de>; Wed,  4 Mar 2020 18:49:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729600AbgCDRt5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Mar 2020 12:49:57 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33139 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729976AbgCDRt4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 4 Mar 2020 12:49:56 -0500
Received: by mail-pg1-f193.google.com with SMTP id m5so1341786pgg.0
        for <linux-omap@vger.kernel.org>; Wed, 04 Mar 2020 09:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6Pcd87jXBoko1RLArOK3JOBlDi7LhTUzZixbyRsnysk=;
        b=KydW31s5IW/9GAa1O2cOf0tr47W3xiu+sI0QS5k4+QTrWO48/QOCDWuN6szRJdWC8t
         m/ZU4WaUCpLcsf9bclQU0uYpXvxA/CFmAjaIBn9jvqddhcgnTC8rY7ASNGsULHLxRTyz
         DpGPCTwJLKmg4lkn/XHl8yyhMdUGpPVZxGJTbvxc/hHkx1J5PSmQftvbfoPmI+ElqXgA
         RLHiSnZdLeCzCa/nSmn7ycYQJ4UrLEiLLec1aKYuIs4xhXwFPUaQVU5eZvXGVVyoPbH6
         99wBpcfSf+LzhQq5UeMHjVCCgeycHumKOAST2EsqrhfXlsOzIumoWMlV51O5jA7QPA8q
         seGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6Pcd87jXBoko1RLArOK3JOBlDi7LhTUzZixbyRsnysk=;
        b=QVIrjgXVIlg8BcoUPGFuntM2ptnhId1xUf/9WitShcIGmKXT0zVUQqAmbsT+Z1LvgS
         TWDh22wqJJ2YiBlpLe8xhko+D7SD91Eg00haiiOB4R0V3pCApmXIIaj6nQ4ybiHZ/pqD
         f9FXUD4UXzElaMWoELnD3/jSgncPZucTMMxlOOZHNVcdIo5Q4q2loLjy/h7yvYcTRDSK
         A5HP7INlBszPvbi6CE2jwNy7ONLSBy4ZHDJ9Dl0l4FQpkoxyPTtfC16/GOi/fVZsuRDN
         Z6jsYDJ4DdpSDVfICtld4pwGrIFnuOXvNFRJ9sC8PWX8O/Sy97xoffqiCXgflTMMYXz5
         PGzA==
X-Gm-Message-State: ANhLgQ2MC5IsC02kbnpm87NfeTtNW2psqWjUjAXD0HvQu1B8pxIREVLN
        Kdt9DuS88DytpLi31Wh4RHFmew==
X-Google-Smtp-Source: ADFU+vvRmOFNnEgqA4kQ83WWcrv9V7CjpSLIyfapy8Mc6wnRSXjV1nvF8cP+fFDnku2nnHZ+vIFuvg==
X-Received: by 2002:a63:4f0c:: with SMTP id d12mr3689461pgb.322.1583344195976;
        Wed, 04 Mar 2020 09:49:55 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id k1sm7834537pgg.56.2020.03.04.09.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 09:49:55 -0800 (PST)
Date:   Wed, 4 Mar 2020 10:49:53 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, afd@ti.com, s-anna@ti.com,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv7 09/15] remoteproc/omap: Check for undefined mailbox
 messages
Message-ID: <20200304174953.GH8197@xps15>
References: <20200221101936.16833-1-t-kristo@ti.com>
 <20200221101936.16833-10-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200221101936.16833-10-t-kristo@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Feb 21, 2020 at 12:19:30PM +0200, Tero Kristo wrote:
> From: Suman Anna <s-anna@ti.com>
> 
> Add some checks in the mailbox callback function to limit
> any processing in the mailbox callback function to only
> certain currently valid messages, and drop all the remaining
> messages. A debug message is added to print any such invalid
> messages when the appropriate trace control is enabled.
> 
> Co-developed-by: Subramaniam Chanderashekarapuram <subramaniam.ca@ti.com>
> Signed-off-by: Subramaniam Chanderashekarapuram <subramaniam.ca@ti.com>
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> ---
>  drivers/remoteproc/omap_remoteproc.c | 6 ++++++
>  drivers/remoteproc/omap_remoteproc.h | 7 +++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index 8c3dc0edae95..5d6f32974aa3 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -130,6 +130,12 @@ static void omap_rproc_mbox_callback(struct mbox_client *client, void *data)
>  		dev_info(dev, "received echo reply from %s\n", name);
>  		break;
>  	default:
> +		if (msg >= RP_MBOX_READY && msg < RP_MBOX_END_MSG)
> +			return;
> +		if (msg > oproc->rproc->max_notifyid) {
> +			dev_dbg(dev, "dropping unknown message 0x%x", msg);
> +			return;
> +		}
>  		/* msg contains the index of the triggered vring */
>  		if (rproc_vq_interrupt(oproc->rproc, msg) == IRQ_NONE)
>  			dev_dbg(dev, "no message was found in vqid %d\n", msg);
> diff --git a/drivers/remoteproc/omap_remoteproc.h b/drivers/remoteproc/omap_remoteproc.h
> index f6d2036d383d..72f656c93caa 100644
> --- a/drivers/remoteproc/omap_remoteproc.h
> +++ b/drivers/remoteproc/omap_remoteproc.h
> @@ -56,6 +56,12 @@
>   *
>   * @RP_MBOX_ABORT_REQUEST: a "please crash" request, used for testing the
>   * recovery mechanism (to some extent).
> + *
> + * Introduce new message definitions if any here.
> + *
> + * @RP_MBOX_END_MSG: Indicates end of known/defined messages from remote core
> + * This should be the last definition.
> + *
>   */
>  enum omap_rp_mbox_messages {
>  	RP_MBOX_READY		= 0xFFFFFF00,
> @@ -64,6 +70,7 @@ enum omap_rp_mbox_messages {
>  	RP_MBOX_ECHO_REQUEST	= 0xFFFFFF03,
>  	RP_MBOX_ECHO_REPLY	= 0xFFFFFF04,
>  	RP_MBOX_ABORT_REQUEST	= 0xFFFFFF05,
> +	RP_MBOX_END_MSG		= 0xFFFFFF06,
>  };
>  
>  #endif /* _OMAP_RPMSG_H */
> -- 
> 2.17.1
> 
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
