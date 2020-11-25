Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F6372C4753
	for <lists+linux-omap@lfdr.de>; Wed, 25 Nov 2020 19:13:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732997AbgKYSMl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 25 Nov 2020 13:12:41 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:36663 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731561AbgKYSMl (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 25 Nov 2020 13:12:41 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606327960; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=RCvQAZfNFC3o6OpRHOzuKPsZ4pdtP2IrwZthHV8sIuA=;
 b=wMn7EchlX1wE7Vnf5CxzVq7Nhba0/0txe1euwoLVQDkiU1gA8BtiB7ftskSwYhDvgnRK9fvy
 7Hr3xr6o3mvThjQZ6BodFvZ3dfnDZyaa/lXa+AZ+rUmpVlM+IEXE93BembilaCeDLfTHSoCs
 XM6J21GtZB1/aw0/n8xfL89MHFI=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyIwZGJlNiIsICJsaW51eC1vbWFwQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5fbe9e97b9b39088ed09d085 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 25 Nov 2020 18:12:39
 GMT
Sender: rishabhb=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 906FBC43462; Wed, 25 Nov 2020 18:12:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 07221C43460;
        Wed, 25 Nov 2020 18:12:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 25 Nov 2020 10:12:36 -0800
From:   rishabhb@codeaurora.org
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: Add a rproc_set_firmware() API
In-Reply-To: <20201121032042.6195-1-s-anna@ti.com>
References: <20201121032042.6195-1-s-anna@ti.com>
Message-ID: <601ce27500c0747a0c0d6d226c7de863@codeaurora.org>
X-Sender: rishabhb@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2020-11-20 19:20, Suman Anna wrote:
> A new API, rproc_set_firmware() is added to allow the remoteproc 
> platform
> drivers and remoteproc client drivers to be able to configure a custom
> firmware name that is different from the default name used during
> remoteproc registration. This function is being introduced to provide
> a kernel-level equivalent of the current sysfs interface to remoteproc
> client drivers, and can only change firmwares when the remoteproc is
> offline. This allows some remoteproc drivers to choose different 
> firmwares
> at runtime based on the functionality the remote processor is 
> providing.
> The TI PRU Ethernet driver will be an example of such usage as it
> requires to use different firmwares for different supported protocols.
> 
> Also, update the firmware_store() function used by the sysfs interface
> to reuse this function to avoid code duplication.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>  drivers/remoteproc/remoteproc_core.c  | 63 +++++++++++++++++++++++++++
>  drivers/remoteproc/remoteproc_sysfs.c | 33 +-------------
>  include/linux/remoteproc.h            |  1 +
>  3 files changed, 66 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> index dab2c0f5caf0..46c2937ebea9 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1934,6 +1934,69 @@ struct rproc *rproc_get_by_phandle(phandle 
> phandle)
>  #endif
>  EXPORT_SYMBOL(rproc_get_by_phandle);
> 
> +/**
> + * rproc_set_firmware() - assign a new firmware
> + * @rproc: rproc handle to which the new firmware is being assigned
> + * @fw_name: new firmware name to be assigned
> + *
> + * This function allows remoteproc drivers or clients to configure a 
> custom
> + * firmware name that is different from the default name used during 
> remoteproc
> + * registration. The function does not trigger a remote processor 
> boot,
> + * only sets the firmware name used for a subsequent boot. This 
> function
> + * should also be called only when the remote processor is offline.
> + *
> + * This allows either the userspace to configure a different name 
> through
> + * sysfs or a kernel-level remoteproc or a remoteproc client driver to 
> set
> + * a specific firmware when it is controlling the boot and shutdown of 
> the
> + * remote processor.
> + *
> + * Return: 0 on success or a negative value upon failure
> + */
> +int rproc_set_firmware(struct rproc *rproc, const char *fw_name)
> +{
> +	struct device *dev;
> +	int ret, len;
> +	char *p;
> +
> +	if (!rproc || !fw_name)
> +		return -EINVAL;
> +
> +	dev = rproc->dev.parent;
> +
> +	ret = mutex_lock_interruptible(&rproc->lock);
> +	if (ret) {
> +		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
> +		return -EINVAL;
> +	}
> +
> +	if (rproc->state != RPROC_OFFLINE) {
> +		dev_err(dev, "can't change firmware while running\n");
> +		ret = -EBUSY;
> +		goto out;
> +	}
> +
> +	len = strcspn(fw_name, "\n");
> +	if (!len) {
> +		dev_err(dev, "can't provide empty string for firmware name\n");
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	p = kstrndup(fw_name, len, GFP_KERNEL);
> +	if (!p) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +
> +	kfree(rproc->firmware);
> +	rproc->firmware = p;
> +
> +out:
> +	mutex_unlock(&rproc->lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL(rproc_set_firmware);
> +
>  static int rproc_validate(struct rproc *rproc)
>  {
>  	switch (rproc->state) {
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c
> b/drivers/remoteproc/remoteproc_sysfs.c
> index 3fd18a71c188..cf846caf2e1a 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -159,42 +159,13 @@ static ssize_t firmware_store(struct device *dev,
>  			      const char *buf, size_t count)
>  {
>  	struct rproc *rproc = to_rproc(dev);
> -	char *p;
> -	int err, len = count;
> +	int err;
> 
>  	/* restrict sysfs operations if not allowed by remoteproc drivers */
>  	if (rproc->deny_sysfs_ops)
>  		return -EPERM;
> 
> -	err = mutex_lock_interruptible(&rproc->lock);
> -	if (err) {
> -		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, err);
> -		return -EINVAL;
> -	}
> -
> -	if (rproc->state != RPROC_OFFLINE) {
> -		dev_err(dev, "can't change firmware while running\n");
> -		err = -EBUSY;
> -		goto out;
> -	}
> -
> -	len = strcspn(buf, "\n");
> -	if (!len) {
> -		dev_err(dev, "can't provide a NULL firmware\n");
> -		err = -EINVAL;
> -		goto out;
> -	}
> -
> -	p = kstrndup(buf, len, GFP_KERNEL);
> -	if (!p) {
> -		err = -ENOMEM;
> -		goto out;
> -	}
> -
> -	kfree(rproc->firmware);
> -	rproc->firmware = p;
> -out:
> -	mutex_unlock(&rproc->lock);
> +	err = rproc_set_firmware(rproc, buf);
> 
>  	return err ? err : count;
>  }
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index dbc3767f7d0e..6e04b99413f8 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -655,6 +655,7 @@ rproc_of_resm_mem_entry_init(struct device *dev,
> u32 of_resm_idx, size_t len,
> 
>  int rproc_boot(struct rproc *rproc);
>  void rproc_shutdown(struct rproc *rproc);
> +int rproc_set_firmware(struct rproc *rproc, const char *fw_name);
>  void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type 
> type);
>  int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da,
> size_t size);
>  int rproc_coredump_add_custom_segment(struct rproc *rproc,

Reviewed-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
